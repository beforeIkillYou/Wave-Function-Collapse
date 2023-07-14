

class Tile{
  PImage img;
  int[] edges=new int[4];//0-up , 1-right , 2-down , 3-left
  
  Tile(PImage img_,String edge) {
    img=img_;
    edges=stringToInt(edge);
  }
  
  int[] stringToInt(String s){
    int[] edge=new int[4];
    for(int i=0;i<s.length();i++){
       edge[i]=s.charAt(i)-48;
    }
    return edge;
  }
  
  boolean isSame(Tile t){
    for(int i=0;i<4;i++){
      if(t.edges[i]!=edges[i])  return false;
    }
    return true;
  }
}
