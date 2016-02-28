//import org.omg.PortableServer.ID_ASSIGNMENT_POLICY_ID;

public class Percolation {
        private int[][] id;
        private int rowNum;
        
     public Percolation(int N) {
      // create N-by-N grid, with all sites blocked
      if (N <= 0)
       throw new IllegalArgumentException("the parameter should be larger than 0");
      id = new int[N][N];
      rowNum = N;
     }
     
     public void open(int i, int j) {
      // open site (row i, column j) if it is not open already
      if (i < 1 || j < 1 || i > rowNum || j > rowNum) {
       throw new IndexOutOfBoundsException("the parameter should be larger than 0");
      }
   
      if (!isOpen(i, j)) {
       id[i - 1][j - 1] = i*rowNum + j;
      
      if (j > 1 && isOpen(i, j - 1)) {
        union(i, j -1, i, j);
      }
      
      if (i > 1 && isOpen(i - 1, j)) {
        union(i - 1, j, i, j);
      }
      
      if (j < rowNum && isOpen(i, j + 1)) {
        union(i, j + 1, i, j); 
      }
      
      if (i < rowNum && isOpen(i + 1, j)) {
        union(i + 1, j, i, j);   
      }
      }
     }

     public boolean isOpen(int i, int j) {
      // is site (row i, column j) open?
      if (i < 1 || j < 1 || i > rowNum || j > rowNum) {
       throw new IndexOutOfBoundsException("the parameter should be larger than 0");
      }
      return id[i - 1][j - 1] != 0;
     }
     
     public boolean isFull(int i, int j) {
      // is site (row i, column j) full?
      if (i < 1 || j < 1 || i > rowNum || j > rowNum) {
       throw new IndexOutOfBoundsException("the parameter should be larger than 0");
      }
      boolean flag = false;
      if (!isOpen(i, j)) 
       return false;
      else {
       for (int col = 1; col <= rowNum; col++) {
           if(isOpen(1, col)) {
               if (root(i, j) == root(1, col)) {
                  flag = true;
                  break;
               }
           }
        }
       return flag;
      }
     }
        
     
     public boolean percolates() {
      // does the system percolate?
      boolean flag = false;
      for (int col = 1; col <= rowNum; col++) {
       if (isFull(rowNum, col)) {
        flag = true;
           break;
       }
      }
      return flag;
     }
     
     private int root(int i, int j)
     {
      if (i < 1 || j < 1 || i > rowNum || j > rowNum) {
       throw new IndexOutOfBoundsException("["+ i  + "," +  j + "]"+"the parameter should be larger than 0");
      }
         int e;
         while ((i >= 1) && (j >= 1) && (i*rowNum + j) != id[i - 1][j - 1]) {
          e = id[i - 1][j - 1];
          i = e/rowNum;
          j = e % rowNum;
          if (j == 0) {
            i = i - 1;
            j = rowNum;
           }
    }
         return i*rowNum + j;
     }
     private void union(int i1, int j1, int i2, int j2)
     {
      //int io1 = i1;
      //int jo1 = j1;
      if (i1 < 1 || j1 < 1 || i1 > rowNum || j1 > rowNum || 
        i2 < 1 || j2 < 1 || i2 > rowNum || j2 > rowNum) {
       throw new IndexOutOfBoundsException("the parameter should be larger than 0");
   }
      if (isOpen(i1, j1)) {
       int prod1 = root(i1, j1);
       int prod2 = root(i2, j2);
       
       i1 = prod1/rowNum;
       j1 = prod1 % rowNum;
       if (j1 == 0) {
         i1 -= 1;
         j1 = rowNum;
    }
       id[i1 - 1][j1 - 1] = prod2;
   }
     }

}


