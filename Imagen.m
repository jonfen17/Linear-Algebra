%--------------------------------------------------------
% Carlos Dioney Blanco González         131370
% Course: Advanced Linear Algebra  Spring 2015
% Imagen scriptfile for making image aproaches with
% principal components analyisis.
%--------------------------------------------------------

imagen    = input('Cómo se llama tu archivo? (con extensión) \n','s'); 
X         = imread(imagen);   % Reads image
X         = double(X);        % Convert to double precision
[U, S, V] = svd(X,0);         % Obtain SVD decomposition
sigma     = diag(S);          % We take diagonal of S
r         = rank(X);          % rank of original matrix

flag_1 = -1; flag_2 = -1; flag_3 = -1;  

% First aproximation
while flag_1 < 0
    fprintf('Rango de tu primera aproximación, menor a %5.3i \n',r)
    r_1 = input('');  % Receive desired rank for first aproximation
  if r_1 < r          % we can't exceed rank of the matrix
  flag_1 = 0;
  end      
end
X1 = componentes_principales(X,r_1);
imwrite(uint8(X1), 'Aprox_1.jpg');
subplot(2,2,1); 
image(X1)
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_1)]);

% Segunda aproximación
while flag_2 < 0
    fprintf('Rango de tu segunda aproximación, menor a %5.3i \n',r)
    r_2 = input(''); % Receive desired rank for second aproximation
  if r_2 < r         % we can't exceed rank of the matrix
  flag_2 = 0;
  end      
end
X10 = componentes_principales(X,r_2);
imwrite(uint8(X10), 'Aprox_2.jpg');
subplot(2,2,2);
image(X10)
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_2)]);

% Tercer aproximación
while flag_3 < 0
    fprintf('Rango de tu tercera aproximación, menor a %5.3i \n',r)
    r_3 = input('');     % Receive desired rank for third aproximation
  if r_3 < r             % we can't exceed rank of the matrix
  flag_3 = 0;
  end      
end
X30 = componentes_principales(X,r);
imwrite(uint8(X30), 'Aprox_3.jpg');
subplot(2,2,3);
image(X30)
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_3)]);

% Imagen original
subplot(2,2,4);
image(X)
colormap(gray(256))
axis image, axis off
r = rank(X);
title(['rank = ' int2str(r)]);
axis image, axis off
title(['rango = ' int2str(r)]);
