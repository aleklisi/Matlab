function  LUT( obraz, przekodowanie )
B = intlut(obraz,przekodowanie);
subplot(1,3,1);
plot(przekodowanie);
title('przekierowanie');
subplot(1,3,2);
imshow(obraz);
title('oryginal');
subplot(1,3,3);
imshow(B);
title('po zmianach');
end

