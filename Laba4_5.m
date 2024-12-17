
function levels = fuzzySetDecomposition(data, levelEdges)
    
    if isempty(levelEdges) || length(levelEdges) < 2
        error('Вектор границ уровней должен содержать как минимум два значения.');
    end
    
    minData = min(data);
    maxData = max(data);
    normalizedData = (data - minData) / (maxData - minData);
    
    numLevels = length(levelEdges) - 1;
    levels = cell(1, numLevels);
    
    for i = 1:numLevels
        levels{i} = data(normalizedData >= levelEdges(i) & normalizedData < levelEdges(i + 1));
    end
    
    levels{numLevels} = [levels{numLevels}, data(normalizedData == levelEdges(end))];
end

function to_levels(data, levelEdges)

levels = fuzzySetDecomposition(data, levelEdges);

for i = 1:length(levels)
    fprintf('Уровень %d: ', i);
    disp(levels{i});
end
end

%
%Задание 1.1............................................
%
levelEdges = [0, 0.3, 0.6, 1]; 
% Дни недели
x = 1:7; 

% Функции принадлежности
A = trapmf(x, [1 1 2 3]); 
B = trapmf(x, [2 4 4 6]);    
C = trapmf(x, [5 6 7 7]); 
D = 1 - max(A, C);        

%Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'Начало недели (A)');
plot(x, B, 'g', 'DisplayName', 'Середина недели (B)');
plot(x, C, 'r', 'DisplayName', 'Конец недели (C)');
plot(x, D, 'm', 'DisplayName', 'Не A и не C (D)');
hold off;

title('Нечёткие множества дней недели');
xlabel('Дни недели');
ylabel('Степень принадлежности');
legend show;
grid on;

%Разделение на уровни
to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);

%
%Задание 1.2.......................................
%

% Возраст
x = 0:120; 

% Функции принадлежности
A = trapmf(x, [0 0 30 40]);    
B = trapmf(x, [60 70 120 120]); 
C = trapmf(x, [0 0 15 20]);     
D = 1 - B;                       

% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'Молодой (A)');
plot(x, B, 'r', 'DisplayName', 'Старый (B)');
plot(x, C, 'g', 'DisplayName', 'Очень молодой (C)');
plot(x, D, 'm', 'DisplayName', 'Не B (D)');
hold off;

title('Нечёткие множества возраста человека');
xlabel('Возраст (лет)');
ylabel('Степень принадлежности');
legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);

%
%Задание 1.3.......................................
%

% Возраст
x = 0:120; 

% Функции принадлежности  Друга 1
A1 = trapmf(x, [0 0 30 40]);    
B1 = trapmf(x, [60 70 120 120]); 
C1 = trapmf(x, [0 0 15 20]);     
D1 = 1 - B;                       

% Функции принадлежности  Друга 1
A2 = trapmf(x, [0 0 50 70]);    
B2 = trapmf(x, [80 90 120 120]); 
C2 = trapmf(x, [0 0 5 15]);     
D2 = 1 - B;                       

% Функции принадлежности  Друга 1
A3 = trapmf(x, [0 0 10 20]);    
B3 = trapmf(x, [30 70 120 120]); 
C3 = trapmf(x, [0 0 5 10]);     
D3 = 1 - B;                   

% Среднее
for i = 1:length(A1)
    A(i) = (A1(i) + A2(i) + A3(i)) / 3;
    B(i) = (B1(i) + B2(i) + B3(i)) / 3;
    C(i) = (C1(i) + C2(i) + C3(i)) / 3;
end  
D = 1 - B;                       

% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'Молодой (A)');
plot(x, B, 'r', 'DisplayName', 'Старый (B)');
plot(x, C, 'g', 'DisplayName', 'Очень молодой (C)');
plot(x, D, 'm', 'DisplayName', 'Не B (D)');
hold off;

title('Нечёткие множества возраста человека');
xlabel('Возраст (лет)');
ylabel('Степень принадлежности');
legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);


%
%Задание 1.4.......................................
%

% Возраст
x = [1,2,3,4,5,6,7]; 

% Функции принадлежности
A = [1 0.8 0.5 0.4 0.5 0.9 0.7];    
B = [0.5 0.3 0.9 0.5 0.2 0 0.6]; 
C = 1 - A;      
D = [0.5 0.8 0.3 0.1 0.3 0 0.6];                        
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'Нравится');
plot(x, B, 'r', 'DisplayName', 'Не понимаю');
plot(x, C, 'g', 'DisplayName', 'Не Нравится');
plot(x, D, 'm', 'DisplayName', 'Глубже');
hold off;

title('Дисциплины');
xlabel('Степень');
ylabel('Виды');
legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);


%
%Задание 1.5.......................................
%

% Возраст
x = 0:0.1:10; 

% Функции принадлежности
A = double(x < 5); 
B = zeros(size(x));
B(x <= 10) = exp((x+5)/-5); 
B(x <= 5) = 0; 
a1 = 3;
a2 = 5;
C = (x - a1)/(a2 - a1);
C(x <= a1) = 0;
C(x >= a2) = 1;
D = 1 ./ (1 + 2 .* x.^2);                       
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'A');
plot(x, B, 'r', 'DisplayName', 'B');
plot(x, C, 'g', 'DisplayName', 'C');
plot(x, D, 'm', 'DisplayName', 'D');
hold off;

legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);


%
%Задание 1.6.......................................
%

% Стоимость
x = 4:1:5000; 

% Функции принадлежности
A = trapmf(x, [1000 2000 3000 4000]); 
B = trapmf(x, [3000 4000 5000 5000]); 
C = trapmf(x, [4 4 1000 2000]);   
                       
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'A');
plot(x, B, 'r', 'DisplayName', 'B');
plot(x, C, 'g', 'DisplayName', 'C');
hold off;

legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);

RA = round(A * 10) / 10;
RB = round(B * 10) / 10;
RC = round(C * 10) / 10;
RD = round(D * 10) / 10;

disp(RA);
disp(RB);
disp(RC);
disp(RD);

%
%Задание 1.7.......................................
%

% Стоимость
x = 4:1:5000; 

% Функции принадлежности
A = trapmf(x, [1000 2000 3000 4000]); 
B = trapmf(x, [3000 4000 5000 5000]); 
C = trapmf(x, [4 4 1000 2000]);   
                       
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'A');
plot(x, B, 'r', 'DisplayName', 'B');
plot(x, C, 'g', 'DisplayName', 'C');
hold off;

legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);
to_levels(C, levelEdges);
to_levels(D, levelEdges);

% Разложение по уровням
disp('Разложение по уровням для A:');
disp('Уровень: a -> x ∈ [1000 + 1000a,4000 - 1000a]');

disp('Разложение по уровням для B:');
disp('Уровень: a -> x ∈ [3000,3000+1000a]');

disp('Разложение по уровням для C:');
disp('Уровень: a -> [0,2000-1000a]');

%
%Задание 1.7.......................................
%

% Стоимость
x = 1:1:9; 

% Функции принадлежности
A = [0 0 0 0 0.4 0.7 1 0.8 0.6]; 
B = [0.8 0 0.8  0.5 0 0 0 0 0]; 
CONA = A .^2;
DELA = sqrt(A);

CONB = B .^2;
DELB = sqrt(B);
                       
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'A');
plot(x, CONA, 'r', 'DisplayName', 'CONA');
plot(x, DELA, 'r', 'DisplayName', 'DELA');
hold off;
legend show;
grid on;

% Отрисовка
figure;
hold on;
plot(x, B, 'b', 'DisplayName', 'A');
plot(x, CONB, 'r', 'DisplayName', 'CONA');
plot(x, DELB, 'r', 'DisplayName', 'DELA');
hold off;
legend show;
grid on;

to_levels(A, levelEdges);
to_levels(B, levelEdges);




to_levels(A, levelEdges);
to_levels(B, levelEdges);


%
%Задание 1.8.......................................
%

% Стоимость
x = 1:0.01:3; 

% Функции принадлежности
A =zeros(size(x));
A(x <= 2) = 0.5;
B = 0.5 .* sin((21/14) .* (x - 1));
A = A - B;

CONA = A .^2;
DELA = sqrt(A);           
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'b', 'DisplayName', 'A');
plot(x, CONA, 'r', 'DisplayName', 'CONA');
plot(x, DELA, 'g', 'DisplayName', 'DELA');
hold off;
legend show;
grid on;


%
%Задание 1.9.......................................
%

% Стоимость
x = 1:1:7;

% Множества
A = [0 0.3 0.7 1 0 0.2 0.6];
B = [0.3 1 0.5 0.8 1 0.5 0.6];
C = [1 0.5 0 0.2 0 0.2 0.9];

inter_AB = min(A, B);
union_AB = max(A, B);
neg_B = 1 - B;
inter_A_NeB = min(A, neg_B);

neg_C = 1 - C;

union_A_NeB = max(A, neg_B);
inter_unionA_NeB_C = min(union_A_NeB, C);

%¬(A ∪ B) и ¬C
Ne_union_AB = 1 - union_AB;
answer = min(Ne_union_AB, neg_C);

%//////////////////////////////

new_A = A .^2 * 0.8;
new_B = B .^2 * 0.5;
new_C = C .^2 * 0.3;

new_answer = max([new_C, new_B, new_A]);
new_answer;

%//////////////////////////////

new_AB = A .* B;
new_C = C .^2;

ura_answer = 0.6 * new_C .* new_AB;
ura_answer;

                   
% Отрисовка
figure;
hold on;
plot(x, inter_AB, 'r', 'DisplayName', 'inter_AB');
plot(x, union_AB, 'b', 'DisplayName', 'union_AB');
plot(x, union_A_NeB, 'd', 'DisplayName', 'union_A_NeB');
plot(x, inter_unionA_NeB_C, 'g', 'DisplayName', 'inter_unionA_NeB_C');
plot(x, answer, 'y', 'DisplayName', 'answer');
hold off;
legend show;
grid on;

%
%Задание 1.10.......................................
%

% Стоимость
x = 1:0.1:3;
U = {'a', 'b', 'c', 'd', 'e', 'f', 'g'};

% Множества
A = (x.^2) / 9;
B = ((x - 3).^2) / 9;

inter_AB = min(A, B);
union_AB = max(A, B);
neg_B = 1 - B;
inter_A_NeB = min(A, neg_B);
union_A_NeB = max(A, neg_B);

Ne_union_AB = 1- union_AB;

hint_answ = zeros(size(A));

                   
% Отрисовка
figure;
hold on;
plot(x, inter_AB, 'r', 'DisplayName', 'inter_AB');
plot(x, union_AB, 'b', 'DisplayName', 'union_AB');
plot(x, inter_A_NeB, 'd', 'DisplayName', 'inter_A_NeB');
plot(x, union_A_NeB, 'g', 'DisplayName', 'union_A_NeB');
plot(x, hint_answ, 'y', 'DisplayName', 'hint_answ');
hold off;
legend show;
grid on;



%
%Задание 1.11.......................................
%

% Стоимость
x = 1:1:5;

% Множества
A = [0.8, 0, 0.6, 0.9, 1];
B = A .^ 2;
C = sqrt(A);
                   
% Отрисовка
figure;
hold on;
plot(x, A, 'r', 'DisplayName', 'A');
plot(x, B, 'b', 'DisplayName', 'B');
plot(x, C, 'y', 'DisplayName', 'C');
hold off;
legend show;
grid on;


%
%Задание 1.12.......................................
%

% Стоимость
x = 1:1:5;

% Множества
A = [1.0 0.5 0.2];
B = [0.3 0.8 1.0 0.8 0.3];

U_A = [4, 5, 6];
U_B = [1, 2, 3, 4, 5];

C = [];
mu_C = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        sum_value = U_A(i) + U_B(j);
        degree = min(A(i), B(j)); % Используем минимум
        idx = find(C == sum_value); % Ищем индекс существующего значения
        if isempty(idx)
            C(end+1) = sum_value; 
            mu_C(end+1) = degree;
        else
            mu_C(idx) = max(mu_C(idx), degree); % Обновляем степень принадлежности
        end
    end
end

E_values = [];
mu_E = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        if U_A(i) >= U_B(j) % Убедимся в неотрицательности
            diff_value = U_A(i) - U_B(j);
            degree = min(A(i), B(j)); % Используем минимум
            idx = find(E_values == diff_value); % Ищем индекс существующего значения
            if isempty(idx)
                E_values(end+1) = diff_value; 
                mu_E(end+1) = degree;
            else
                mu_E(idx) = max(mu_E(idx), degree); % Обновляем степень принадлежности
            end
        end
    end
end


D_values = [];
mu_D = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        prod_value = U_A(i) * U_B(j);
        degree = min(A(i), B(j)); % Используем минимум
        idx = find(D_values == prod_value); % Ищем индекс существующего значения
        if isempty(idx)
            D_values(end+1) = prod_value; 
            mu_D(end+1) = degree;
        else
            mu_D(idx) = max(mu_D(idx), degree); % Обновляем степень принадлежности
        end
    end
end


F_values = [];
mu_F = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        if U_B(j) ~= 0 % Проверяем деление на ноль
            div_value = U_A(i) / U_B(j);
            degree = min(A(i), B(j)); % Используем минимум
            idx = find(F_values == div_value); % Ищем индекс существующего значения
            if isempty(idx)
                F_values(end+1) = div_value; 
                mu_F(end+1) = degree;
            else
                mu_F(idx) = max(mu_F(idx), degree); % Обновляем степень принадлежности
            end
        end
    end
end


function [G_values, mu_G] = calcMax(U_A,U_B,A,B)
G_values = [];
mu_G = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        max_value = max(U_A(i), U_B(j));
        degree = min(A(i), B(j)); % Используем максимум
        idx = find(G_values == max_value); % Ищем индекс существующего значения
        if isempty(idx)
            G_values(end+1) = max_value; 
            mu_G(end+1) = degree;
        else
            mu_G(idx) = max(mu_G(idx), degree); % Обновляем степень принадлежности
        end
    end
end
end
[G_values,mu_G] = calcMax(U_A,U_B,A,B);


function [H_values, mu_H] = calcMin(U_A,U_B,A,B)
H_values = [];
mu_H = [];
for i = 1:length(U_A)
    for j = 1:length(U_B)
        min_value = min(U_A(i), U_B(j));
        degree = min(A(i), B(j)); % Используем минимум
        idx = find(H_values == min_value); % Ищем индекс существующего значения
        if isempty(idx)
            H_values(end+1) = min_value; 
            mu_H(end+1) = degree;
        else
            mu_H(idx) = max(mu_H(idx), degree); % Обновляем степень принадлежности
        end
    end
end
end
[H_values,mu_H] = calcMin(U_A,U_B,A,B);

function [sortedValues, sortedDegrees] = sortAndRemoveDuplicates(values, degrees)
    [sortedValues, uniqueIdx] = unique(values);
    sortedDegrees= zeros(size(sortedValues));
    
    for i=1:length(uniqueIdx)
        sortedDegrees(i)=max(degrees(values==sortedValues(i)));
    end
    
end


[C_sorted, mu_C_sorted]  	= sortAndRemoveDuplicates(C, mu_C);
[E_sorted, mu_E_sorted]  	= sortAndRemoveDuplicates(E_values, mu_E);
[D_sorted, mu_D_sorted]  	= sortAndRemoveDuplicates(D_values, mu_D);
[F_sorted, mu_F_sorted]  	= sortAndRemoveDuplicates(F_values, mu_F);
[G_sorted, mu_G_sorted]  	= sortAndRemoveDuplicates(G_values, mu_G);
[H_sorted, mu_H_sorted]  	= sortAndRemoveDuplicates(H_values, mu_H);


figure;
hold on;

% Графики для A и B
plot(U_A, A, 'r', 'DisplayName', 'A (немного больше 3)');
plot(U_B, B, 'b', 'DisplayName', 'B (примерно 3)');


% Графики для операций с отсортированными значениями и степенями принадлежности 
plot(C_sorted, mu_C_sorted, '-d', 'DisplayName', 'C (A + B)');
%plot(E_sorted, mu_E_sorted, '-x', 'DisplayName', 'E (A - B)');
%plot(D_sorted, mu_D_sorted, '-^', 'DisplayName', 'D (A * B)');
%plot(F_sorted, mu_F_sorted, '-v', 'DisplayName', 'F (A / B)');
%plot(G_sorted, mu_G_sorted, '--', 'DisplayName', 'G (max(A,B))');
%plot(H_sorted, mu_H_sorted, '--', 'DisplayName', 'H (min(A,B))');


xlabel('Значения');
ylabel('Степень принадлежности');
title('Opers');
legend show;
grid on;
hold off;
