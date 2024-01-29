Описание задания.

 1 уровень сложности: В рамках БД "песочница" напишите след/запросы:


2.Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)
SELECT
    Orders.OrderID,
    SUM(OrderDetails.Quantity * Products.Price) AS TotalOrderCost
FROM
    Orders
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Orders.OrderID
HAVING
    TotalOrderCost >= 5000;

3.Вывести страны, в которые было отправлено 3 и более заказов
SELECT
    Customers.Country,
    COUNT(Orders.OrderID) AS OrderCount
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
    Customers.Country
HAVING
    OrderCount >= 3;


4.Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)
SELECT
    Products.ProductName,
    SUM(OrderDetails.Quantity) AS SoldUnits
FROM
    Products
JOIN
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY
    Products.ProductID, Products.ProductName
ORDER BY
    SoldUnits DESC
LIMIT 10;

5.Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT
    Employees.EmployeeID,
    Employees.LastName,
    Employees.FirstName,
    0.05 * SUM(OrderDetails.Quantity * Products.Price) AS Salary
FROM
    Employees
JOIN
    Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Employees.EmployeeID BETWEEN 1 AND 9
GROUP BY
    Employees.EmployeeID, Employees.LastName, Employees.FirstName;


Дополните схему БД "онлайн-шахматы" функционалом групповых чатов

https://dbdiagram.io/d/65ab8a55ac844320ae54b839