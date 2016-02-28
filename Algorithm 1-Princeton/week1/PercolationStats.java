//import javax.swing.RootPaneContainer;
import edu.princeton.cs.algs4.StdStats;
import edu.princeton.cs.algs4.StdRandom;
//import java.util.Scanner;  

public class PercolationStats {
    
  private double[] threshold;
  private Percolation per;
  private int expTime; 
  
  public PercolationStats(int N, int T) {
   // perform T independent experiments on an N-by-N grid
   if (N <= 0 || T <= 0) {
   throw new IllegalArgumentException("the inial parameter should be larger than 0");
  }
   threshold = new double[T];
   expTime = T;
   
   for (int i = 0; i < T; i++) {
    per = new Percolation(N);

    int num = 0;
    while (!per.percolates()) {
    int row_id = StdRandom.uniform(1, N + 1);
    int col_id = StdRandom.uniform(1, N + 1);
    if (per.isOpen(row_id, col_id)) {
     continue;
    }
    else {
     per.open(row_id, col_id);
     num++;
    }
  
   }
   /*
    int col, row, i, num = 0;
    for (i = 1; i <= N ; i++) {
     if (per.isFull(N, i)) {
         break;      
     }
    }
    for (row = 1; row <= N ; row++) {
     for (col = 1; col <= N ; col++) {
      if (per.isOpen(row, col)) {
       if(per.root(row, col) == per.root(N, i)){
        num++;
       }
      }
    }*/
    
    threshold[i] = 1.0*num/(N*N);
    
   }
   }
    public double mean() {
     // sample mean of percolation threshold
     return StdStats.mean(threshold);
    }
    public double stddev()  {
     // sample standard deviation of percolation threshold
     return StdStats.stddev(threshold);
    }
    public double confidenceLo() {
     // low  endpoint of 95% confidence interval
     return (mean() - 1.96*stddev()/Math.sqrt(expTime));
    }
    public double confidenceHi() {
     // high endpoint of 95% confidence interval
     return (mean() + 1.96*stddev()/Math.sqrt(expTime));
    }
 public static void main(String[] args) {
  // TODO Auto-generated method stub
  //Scanner sc = new Scanner(System.in);
  //int N = sc.nextInt();
  //int T = sc.nextInt();
  //sc.close();
  PercolationStats perstat = new PercolationStats(200, 100);
  System.out.println("mean\t\t\t=" + perstat.mean());
  System.out.println("stddev \t\t\t=" + perstat.stddev());
  System.out.println("95% confidence interval =" + perstat.confidenceLo() + perstat.confidenceHi());
 }

}
