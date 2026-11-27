
-- =========================================
-- БАЗА ДАННЫХ: ОТДЕЛ КАДРОВ
-- =========================================

-- 1. СОЗДАНИЕ ТАБЛИЦ

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100),
    office_number INT,
    phone VARCHAR(20)
);

CREATE TABLE Positions (
    position_id SERIAL PRIMARY KEY,
    position_name VARCHAR(100),
    salary DECIMAL(10,2),
    responsibilities TEXT
);

CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    hire_date DATE,
    department_id INT REFERENCES Departments(department_id),
    position_id INT REFERENCES Positions(position_id)
);


-- =========================================
-- 2. ЗАПОЛНЕНИЕ ТАБЛИЦ
-- =========================================

-- Отделы

INSERT INTO Departments
(department_name, office_number, phone)
VALUES
('Бухгалтерия', 101, '89001111101'),
('ИТ-отдел', 102, '89001111102'),
('Отдел кадров', 103, '89001111103'),
('Отдел продаж', 104, '89001111104'),
('Юридический отдел', 105, '89001111105'),
('Маркетинг', 106, '89001111106'),
('Логистика', 107, '89001111107'),
('Производство', 108, '89001111108'),
('Снабжение', 109, '89001111109'),
('Служба безопасности', 110, '89001111110');

-- Должности

INSERT INTO Positions
(position_name, salary, responsibilities)
VALUES
('Директор', 150000, 'Управление организацией'),
('Бухгалтер', 75000, 'Ведение бухгалтерского учета'),
('Программист', 100000, 'Разработка программ'),
('Менеджер', 65000, 'Работа с клиентами'),
('Инспектор отдела кадров', 70000, 'Ведение кадровой документации'),
('Юрист', 85000, 'Правовое сопровождение'),
('Маркетолог', 80000, 'Продвижение компании'),
('Логист', 70000, 'Организация перевозок'),
('Инженер', 90000, 'Контроль производства'),
('Охранник', 45000, 'Обеспечение безопасности');

-- Сотрудники

INSERT INTO Employees
(full_name, hire_date, department_id, position_id)
VALUES
('Иванов Иван Иванович', '2022-03-15', 1, 2),
('Петров Петр Сергеевич', '2021-06-10', 2, 3),
('Сидорова Анна Викторовна', '2023-01-20', 3, 5),
('Смирнов Алексей Олегович', '2020-09-05', 4, 4),
('Кузнецова Мария Андреевна', '2022-11-12', 5, 6),
('Попов Дмитрий Игоревич', '2021-04-18', 6, 7),
('Васильев Сергей Павлович', '2023-05-22', 7, 8),
('Михайлова Елена Романовна', '2019-08-30', 8, 9),
('Федоров Николай Денисович', '2022-07-14', 9, 1),
('Алексеева Ольга Максимовна', '2024-02-01', 10, 10);


-- =========================================
-- 3. ПЯТЬ ЗАПРОСОВ НА ВЫБОРКУ
-- =========================================

-- Запрос 1. Вывести всех сотрудников

SELECT * FROM Employees;


-- Запрос 2. Вывести сотрудников и их отделы

SELECT
    Employees.full_name,
    Departments.department_name
FROM Employees
JOIN Departments
ON Employees.department_id = Departments.department_id;


-- Запрос 3. Сотрудники с зарплатой больше 70000

SELECT
    Employees.full_name,
    Positions.position_name,
    Positions.salary
FROM Employees
JOIN Positions
ON Employees.position_id = Positions.position_id
WHERE Positions.salary > 70000;


-- Запрос 4. Сотрудники отдела кадров

SELECT
    Employees.full_name,
    Employees.hire_date,
    Departments.department_name
FROM Employees
JOIN Departments
ON Employees.department_id = Departments.department_id
WHERE Departments.department_name = 'Отдел кадров';


-- Запрос 5. Сотрудники по убыванию зарплаты

SELECT
    Employees.full_name,
    Positions.position_name,
    Positions.salary
FROM Employees
JOIN Positions
ON Employees.position_id = Positions.position_id
ORDER BY Positions.salary DESC;
