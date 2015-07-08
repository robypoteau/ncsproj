function y = sat(x,phi)
     if abs(x) > phi
          y = sign(x);
     else 
          y = x/phi;
     end
end