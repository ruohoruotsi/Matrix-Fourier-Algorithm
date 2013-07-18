%
% test script for proposed Matrix Fourier Algorithm (MFA)
%


% setup 16 element matrix for the same vector (sans ;)
xx = [1 2 3 4 5 6 7 8  9 10 11 12  13 14 15 16];
x = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]

row_size = size(x,1);
col_size = size(x,2);


% 1. Apply a (length R) FFT on each column.
for i = 1:row_size,    
    y(:,i) = fft(x(:,i));  % on column
    %y(i,:) = fft(x(i,:));   % on row
end

% 2. Multiply each matrix element (index r, c) by exp(? 2 ? i r c/n). aka Twiddle factors
for m = 1:row_size,  
    for n = 1:col_size,
        y(m,n) = y(m,n) * exp(-j*2*pi * (m-1)*(n-1)/16);
    end
end

% 3. Apply a (length C) FFT on each row.
for i = 1:col_size,    
    z(i,:) = fft(y(i,:));  % on row
    %z(:,i) = fft(y(:,i));   % on column
end

% 4. Transpose to get back to row order
z = z'
fft(xx)'




