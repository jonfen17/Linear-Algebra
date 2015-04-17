%--------------------------------------------------------
% Carlos Dioney Blanco González         131370
% Course: Advanced Linear Algebra  Spring 2015
% Imagen scriptfile for making image approaches with
% principal component analyisis for 3 different ranks
%--------------------------------------------------------

imagen    = input('Cómo se llama tu archivo? (con extensión) \n','s'); 
X         = imread(imagen);   % Reads image
X         = double(X);        % Convert to double precision
[U, S, V] = svd(X,0);         % Obtain SVD decomposition
sigma     = diag(S);          % We take the diagonal of S
r         = rank(X);          % rank of original matrix

flag_1 = -1; flag_2 = -1; flag_3 = -1;  

% First approximation
while flag_1 < 0
    fprintf('Rango de tu primera aproximación, menor a %5.3i \n',r)
    r_1 = input('');  % Receive desired rank for first approximation
  if r_1 < r          % we can't exceed rank of the matrix
  flag_1 = 0;
  end      
end
X1 = Principal_Components(X,r_1);   % Use Principal Components to get an approach
imwrite(uint8(X1), 'Aprox_1.jpg');  % Save first approximation
subplot(2,2,1);                     % Position first image
image(X1)                           % Display
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_1)]);

% Second approximation
while flag_2 < 0
    fprintf('Rango de tu segunda aproximación, menor a %5.3i \n',r)
    r_2 = input(''); % Receive desired rank for second approximation
  if r_2 < r         % we can't exceed rank of the matrix
  flag_2 = 0;
  end      
end
X2 = Principal_Components(X,r_2); % Use Principal Components to get an approach
imwrite(uint8(X2), 'Aprox_2.jpg');   % Save second approximation
subplot(2,2,2);                      % Position second image
image(X2)                            % Display
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_2)]);

% Third approach
while flag_3 < 0
    fprintf('Rango de tu tercera aproximación, menor a %5.3i \n',r)
    r_3 = input('');     % Receive desired rank for third aproximation
  if r_3 < r             % we can't exceed rank of the matrix
  flag_3 = 0;
  end      
end
X3 = Principal_Components(X,r); % Use Principal Components to get an approach
imwrite(uint8(X3), 'Aprox_3.jpg'); % Save third approximation
subplot(2,2,3);                    % Position second image
image(X3)                          % Display
colormap(gray(256))
axis image, axis off
title(['rango = ' int2str(r_3)]);

% Imagen original
subplot(2,2,4);                 % Position original matrix 
image(X)                        % Display
colormap(gray(256))
axis image, axis off
r = rank(X);
title(['rank = ' int2str(r)]);
axis image, axis off
title(['rango = ' int2str(r)]);
