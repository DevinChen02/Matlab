function color = rgb_color(rgb)
% RGB_COLOR outputs color of mixture resulted from input primary
% colors. The input rgb is a 3-element vector with values of 0 or 1
% indicating the primary colors (red, green and blue, respectively). The
% output color is a string indicating color of mixture.
% Call format: color = rgb_color(rgb)

if any (rgb ~= 0 & rgb ~= 1)
    color = 'Invalid input';
    return;
end

if rgb(1)
   if rgb(2)
       if rgb(3)
           color = 'white';
       else
           color = 'yellow';
       end
   else
       if rgb(3)
          color = 'magenta';
       else
          color = 'red';
       end
   end
else
  if rgb(2)
       if rgb(3)
           color = 'cyan';
       else
           color = 'green';
       end
  else
       if rgb(3)
           color = 'blue';
       else
           color = 'Invalid inputs';
       end
   end 
end

end % function rgb_color