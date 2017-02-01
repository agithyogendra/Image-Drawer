import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
PImage img;
File path;
void setup(){
  
  size(1215, 717);
  /*Choose image file form comeputer*/
  JFileChooser chooser = new JFileChooser();
  chooser.setFileFilter(chooser.getAcceptAllFileFilter());
  int returnVal = chooser.showOpenDialog(null);
 
    if(returnVal == JFileChooser.APPROVE_OPTION) 
  {
    JOptionPane.showMessageDialog(null, "You chose the image file: " + chooser.getSelectedFile().getName());
    
    /*Set path of image*/
    path = chooser.getSelectedFile();
  }else{
    JOptionPane.showMessageDialog(null, "You did not choose an image file, program will now exit", "Error!", JOptionPane.WARNING_MESSAGE);
    System.exit(0);
    
  }
  
  /*Load Image*/
  img = loadImage(path.toString());
  background(0);
}

void draw(){
  /*Paint 600 random lines per frame*/
 for(int i = 0; i < 600; i++){
   /*Get random x & y locations on the screen*/
   float x = random(width);
   float y = random(height);
   /*Extract the color of the random pixels from the image file*/
   color c = img.get(int (x), int (y));
   /*Draw 2x2 lines from the random location*/ 
   stroke(c, 25);
   line(x, y, x+2, y+2);
 }
}