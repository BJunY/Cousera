function [] = plot2bytheta(theta)
STR = sprintf('%f+%f*x+%f*y',theta(1), theta(2), theta(3));
ezplot(STR);