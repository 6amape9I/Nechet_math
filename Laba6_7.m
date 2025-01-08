%Cогласованность
function con = checkCon(pairwiseComparisons,os)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);

    pairColumnSum = sum(pairwiseComparisons);
    %disp(pairColumnSum);

    labmdaMax = dot(pairGeomeanNorm,pairColumnSum);
    is = (labmdaMax - length(pairwiseComparisons))/(length(pairwiseComparisons)-1);
    con = is/os < 0.1;
end

function degrees = calcDegrees(pairwiseComparisons)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);
    degrees = pairGeomeanNorm;
end
function outputString = displayNewFuzzySet(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % конкатенируем
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %d | %.2f\n", names(i), degrees(i)));
    end
end

function outputString = displayNewFuzzySetStr(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % конкатенируем
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %s | %.2f\n", names(i), degrees(i)));
    end
end

%
%Задание 1.......................................
%

% По мощности
names = 1:6;
pairwiseComparisonsPower = [
    [1, 3, 3, 1/2, 2, 1]
    [1/3, 1, 1, 1/3, 1/2, 1/3]
    [1/3, 1, 1, 1/3, 1/2, 1/3]
    [2, 3, 3, 1, 3, 2]
    [1/2, 2, 2, 1/3, 1, 1/3]
    [1, 3, 3, 1/2, 1/3, 1]
];
disp(checkCon(pairwiseComparisonsPower,1.24));
degreesPower = calcDegrees(pairwiseComparisonsPower);
disp(displayNewFuzzySet(degreesPower,names,"EnginePower"))

% По моменту
names = 1:6;
pairwiseComparisonsMoment = [
    [1,   1/3, 1/2, 1,   1/2, 2]
    [3,   1,   2,   3,   2,   4]
    [2,   1/2, 1,   2,   1,   3]
    [1,   1/3, 1/2, 1,   1/2, 2]
    [2,   1/2, 1,   2,   1,   3]
    [1/2, 1/4, 1/3, 1/2, 1/3, 1]
];
disp(checkCon(pairwiseComparisonsMoment,1.24));
degreesMoment = calcDegrees(pairwiseComparisonsMoment);
disp(displayNewFuzzySet(degreesMoment,names,"Moment"))

% По весу
names = 1:6;
pairwiseComparisonsWeight = [
    [1,   3,   2,   1/3, 2,   1/5]
    [1/3, 1,   1/2, 1/4, 1/2, 1/6]
    [1/2, 2,   1,   1/2,   1, 1/4]
    [3,   4,   2,   1,   3,   1/2]
    [1/2, 2,   1,   1/3, 1,   1/4]
    [5,   6,   4,   2,   4,   1]
];
disp(checkCon(pairwiseComparisonsWeight,1.24));
degreesWeight = calcDegrees(pairwiseComparisonsWeight);
disp(displayNewFuzzySet(degreesWeight,names,"Weight"))


% Сравнение самих критериев
% По весу
names = ["Мощность","Момент","Вес"];
pairwiseComparisonsProp = [
    [1,   2,   3]
    [1/2, 1,   2]
    [1/3, 1/2,   1]
];
disp(checkCon(pairwiseComparisonsProp,0.58));
degreesProps = calcDegrees(pairwiseComparisonsProp);
disp(displayNewFuzzySetStr(degreesProps,names,"Props"))
% Финальное вычисление
result = cat(2,degreesPower,degreesMoment,degreesWeight) * degreesProps;
names = 1:6;
disp(displayNewFuzzySet(result,names,"Engines"));

%
%Задание 2.......................................
%

% По прибыли
names = 1:6;
pairwiseComparisonsProfit = [
    [1,   3,   1/2, 2, 4, 1/4]
    [1/3, 1,   1/3, 1/2, 3, 1/4]
    [2,   3,   1,   2, 4, 1/3]
    [1/2, 2,   1/2, 1, 3, 1/3]
    [1/4, 1/3, 1/4, 1/3,  1, 1/5]
    [4,   4,   3,   3,    5, 1]
];
disp(checkCon(pairwiseComparisonsProfit,1.24));
degreesProfit = calcDegrees(pairwiseComparisonsProfit);
disp(displayNewFuzzySet(degreesProfit,names,"Profit"))

% По себестоимости единицы продукции
names = 1:6;
pairwiseComparisonsCost = [
    [1,   1/6, 2,   1/3, 1/8, 1/3]
    [6,   1,   6,   3,   1/3, 3]
    [1/2, 1/6, 1,   1/3, 1/6, 1/3]
    [3,   1/3, 3,   1,   1/4, 1]
    [8,   3,   6,   4,   1,   5]
    [3,   1/3, 3,   1,   1/5, 1]
];
disp(checkCon(pairwiseComparisonsCost,1.24));
degreesCost = calcDegrees(pairwiseComparisonsCost);
disp(displayNewFuzzySet(degreesCost,names,"Cost"))

% По доходу
names = 1:6;
pairwiseComparisonsIn = [
    [1,   1/2, 1/7, 1/4, 1,   1/5]
    [2,   1,   1/5, 1/3, 3,   1/4]
    [7,   5,   1,   4,   6,   3]
    [4,   3,   1/4, 1,   4,   1/2]
    [1,   1/3, 1/6, 1/4, 1,   1/5]
    [5,   4,   1/3, 2,   5,   1]
];
disp(checkCon(pairwiseComparisonsIn,1.24));
degreesIn = calcDegrees(pairwiseComparisonsIn);
disp(displayNewFuzzySet(degreesIn,names,"Income"))


% Сравнение самих критериев
% По весу
names = ["Прибыль","Себестоимость","Доходы"];
pairwiseComparisonsProp = [
    [1,   2,   3]
    [1/2, 1,   2]
    [1/3, 1/2,   1]
];
disp(checkCon(pairwiseComparisonsProp,0.58));
degreesProps = calcDegrees(pairwiseComparisonsProp);
disp(displayNewFuzzySetStr(degreesProps,names,"Props"))
% Финальное вычисление
result = cat(2,degreesProfit,degreesCost,degreesIn) * degreesProps;
names = 1:6;
disp(displayNewFuzzySet(result,names,"Industries"));


%
%Задание 3.......................................
%

% По мощности
names = 1:6;
pairwiseComparisonsPower = [
    [1,   3,   1/2, 2, 4, 1/4],
    [1/3, 1,   1/3, 1/2, 3, 1/4],
    [2,   3,   1,   2, 4, 1/3],
    [1/2, 2,   1/2, 1, 3, 1/3],
    [1/4, 1/3, 1/4, 1/3,  1, 1/5],
    [4,   4,   3,   3,    5, 1],
];
disp(checkCon(pairwiseComparisonsPower,1.24));
degreesPower = calcDegrees(pairwiseComparisonsPower);
disp(displayNewFuzzySet(degreesPower,names,"Power"))

% По крутящему моменту
names = 1:6;
pairwiseComparisonsWeight = [
    [1,   3,   6,   4,   1,   5]
    [1/3, 1,   5,   3,   1/2, 4]
    [1/6, 1/5, 1,   1/4, 1/6, 1/3]
    [1/4, 1/3, 4,   1,   1/4, 1/2]
    [1,   2,   6,   4,   1,   5]
    [1/5, 1/4, 3,   2,   1/5, 1]
];

disp(checkCon(pairwiseComparisonsWeight,1.24));
degreesWeight = calcDegrees(pairwiseComparisonsWeight);
disp(displayNewFuzzySet(degreesWeight,names,"Weight"));

% По крутящему моменту
names = 1:6;
pairwiseComparisonsMoment = [
    [1,   3,   1/3, 2,   5,   2]
    [1/3, 1,   1/4, 1/3, 3,   1/4]
    [3,   4,   1,   3,   6,   3]
    [1/2, 3,   1/3, 1,   4,   1]
    [1/5, 1/3, 1/6, 1/4, 1,   1/5]
    [1/2, 4,   1/3, 1,   5,   1]
];
disp(checkCon(pairwiseComparisonsMoment,1.24));
degreesMoment = calcDegrees(pairwiseComparisonsMoment);
disp(displayNewFuzzySet(degreesMoment,names,"Moment"))


% Сравнение самих критериев
% По весу
names = ["Мощность","Момент","Масса"];
pairwiseComparisonsProp = [
    [1,   2,   3]
    [1/2, 1,   2]
    [1/3, 1/2,   1]
];
disp(checkCon(pairwiseComparisonsProp,0.58));
degreesProps = calcDegrees(pairwiseComparisonsProp);
disp(displayNewFuzzySetStr(degreesProps,names,"Props"))
% Финальное вычисление
result = cat(2,degreesPower,degreesMoment,degreesWeight) * degreesProps;
names = 1:6;
disp(displayNewFuzzySet(result,names,"Engine"));