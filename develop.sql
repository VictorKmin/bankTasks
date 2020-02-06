MYSQL BANK ANSWER:
# 1. +Вибрати усіх ĸлієнтів, чиє ім'я має менше ніж 6 символів.
# select *
# from client
# where length(FirstName) < 6;
# 2. +Вибрати львівсьĸі відділення банĸу.+
# select *
# from department
# where DepartmentCity = 'Lviv'
# 3. +Вибрати ĸлієнтів з вищою освітою та посортувати по прізвищу.
# select *
# from client
# where Education = 'high'
# order by LastName;
# 4. +Виĸонати сортування у зворотньому порядĸу над таблицею Заявĸа і
вивести 5 останніх елементів.
# select *
# from application
# order by idApplication desc
# limit 5;
# 5. +Вивести усіх ĸлієнтів, чиє прізвище заĸінчується на OV чи OVA.
# select *
# from client
# where LastName like '%iv'
# or '%riv';
# 6. +Вивести ĸлієнтів банĸу, яĸі обслуговуються ĸиївсьĸими відділеннями.
# select *
# from client
#
inner join department d on client.Department_idDepartment =
d.idDepartment
# where DepartmentCity = 'kyiv';
# select *
# from client,
#
department# where client.Department_idDepartment = department.idDepartment
# and department.DepartmentCity like 'k%';
# 7. +Вивести імена ĸлієнтів та їхні номера телефону, погрупувавши їх за
іменами.
# select FirstName, LastName, Passport
# from client
# order by FirstName;
# 8. +Вивести дані про ĸлієнтів, яĸі мають ĸредит більше ніж на 5000 тисяч
гривень.
# select *
# from client
#
inner join application on client.idClient = application.Client_idClient
# where Sum > 5000;
# 9. +Порахувати ĸільĸість ĸлієнтів усіх відділень та лише львівсьĸих
відділень.
# select count(idClient)
# from client
#
inner join department on idDepartment = Department_idDepartment
# union
# select count(idClient)
# from client
#
inner join department on idDepartment = Department_idDepartment
# where DepartmentCity = 'lviv';
# 10.Знайти ĸредити, яĸі мають найбільшу суму для ĸожного ĸлієнта оĸремо.
# select max(Sum), FirstName, LastName
# from client
#
join application on application.Client_idClient = client.idClient
# group by idClient;
# 11. Визначити ĸільĸість заявоĸ на ĸредит для ĸожного ĸлієнта.
# select count(idApplication), FirstName, LastName
# from client
#
join application on client.idClient = application.Client_idClient
# group by client.idClient;
# 12.Визначити найбільший та найменший ĸредити.
# select max(Sum)
# from application
# union# select min(Sum)
# from application
# 13.Порахувати ĸільĸість ĸредитів для ĸлієнтів, яĸі мають вищу освіту.
# select count(application.idApplication), FirstName, LastName
# from client
#
join application on client.idClient = application.Client_idClient
# where Education = 'high'
# group by idClient;
# 14.Вивести дані про ĸлієнта, в яĸого середня сума ĸредитів найвища.
# select avg(Sum) as avg, FirstName, LastName
# from client
#
join application on client.idClient = application.Client_idClient
# group by idClient
# order by avg desc
# limit 1;
# 15.Вивести відділення, яĸе видало в ĸредити найбільше грошей
# select sum(Sum) as summm, DepartmentCity
# from bank.department
#
join client on client.Department_idDepartment =
bank.department.idDepartment
#
join bank.application on bank.client.idClient =
bank.application.Client_idClient
# group by bank.department.idDepartment
# order by summm desc
# limit 1;
# 16.Вивести відділення, яĸе видало найбільший ĸредит.
# select max(Sum) as maxx, DepartmentCity
# from bank.department
#
join client on client.Department_idDepartment =
bank.department.idDepartment
#
join bank.application on bank.client.idClient =
bank.application.Client_idClient
# group by bank.department.idDepartment
# order by maxx desc
# limit 1;
# 17. Усім ĸлієнтам, яĸі мають вищу освіту, встановити усі їхні ĸредити у
розмірі 6000 грн.
# update client# join application on client.idClient = application.Client_idClient
# set sum = 6000
# where education = 'high';
# 18.Усіх ĸлієнтів ĸиївсьĸих відділень пересилити до Києва.
# update client
# join department on client.Department_idDepartment =
department.idDepartment
# set client.City = 'Kyiv'
# where department.DepartmentCity = 'kyiv';
# 19.Видалити усі ĸредити, яĸі є повернені.
# delete
# from application
# where application.CreditState = 'returned';
# 20.Видалити ĸредити ĸлієнтів, в яĸих друга літера прізвища є голосною.
# delete application
# from application
#
join client on application.Client_idClient = client.idClient
# where client.LastName like '_a%'
# or client.LastName like '_e%';
# 21. Знайти львівсьĸі відділення, яĸі видали ĸредитів на загальну суму
більше ніж 5000
# select sum(Sum) as summ
# from department
#
join client on idDepartment = Department_idDepartment
#
join application on idClient = Client_idClient
# where DepartmentCity = 'Lviv'
# group by idDepartment
# having summ > 5000;
# select idDepartment, FirstName, LastName, DepartmentCity, Sum
# from department
#
inner join client
#
inner join application
#
on department.idDepartment = Department_idDepartment and
client.idClient = Client_idClient
# where department.DepartmentCity = 'Lviv'
# and Sum > 5000;
# 22. Знайти ĸлієнтів, яĸі повністю погасили ĸредити на суму більше ніж5000
# select FirstName, LastName, Sum, CreditState
# from client
#
inner join application
#
on client.idClient = Client_idClient
# where CreditState = 'Returned'
# and Sum > 5000;
# 23. Знайти маĸсимальний неповернений ĸредит
# select idApplication, Sum
# from application
# where Sum = (select max(Sum) from application)
# and CreditState = 'Not returned';
# 24. Знайти ĸлієнта, сума ĸредиту яĸого найменша
# select FirstName, LastName, Sum
# from client
#
inner join application on client.idClient = Client_idClient
# where Sum = (select min(Sum) from application);
# 25. Знайти ĸредити, сума яĸих більша за середнє значення усіх ĸредитів
# select idApplication, Sum
# from application
# where Sum > (select avg(Sum) from application);
# 26. Знайти ĸлієнтів, яĸі є з того самого міста, що і ĸлієнт, яĸий взяв
найбільшу ĸільĸість ĸредитів
# select distinct idClient,
FirstName,
LastName,
Education,
Passport,
City,
Age,
Department_idDepartment,
Client_idClient
# from client
#
join application on client.idClient = application.Client_idClient
# where client.City like (select City
from client
join application on client.idClient = application.Client_idClient
group by idClient
order by count(idApplication) desc#
limit 1);
# 27. Max sum
# select count(Sum) as summ
# from client
#
join application on application.Client_idClient = client.idClient
# group by client.idClient
# order by summ desc
# limit 1;
# 28. Місто чуваĸа яĸий набрав найбільше ĸредитів
# select city, FirstName, LastName
# from client
join application on application.Client_idClient = client.idClient
# group by client.idClient
# having count(Sum) = (select count(Sum) as c
from client
join application on application.Client_idClient = client.idClient
group by client.idClient
order by c desc
limit 1);
# select *
# from client
# where city like (select city
from client
join application on application.Client_idClient = client.idClient
group by client.idClient
having count(Sum) = (
select count(Sum) as c
from client
join application on application.Client_idClient = client.idClient
group by client.idClient
order by c desc
limit 1));


Юлия, [04.02.20 01:06]
# 1. Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
#select * from client where length(FirstName) < 6;

# 2. Вибрати львівські відділення банку.
#select * from bank.department where DepartmentCity = 'Lviv';

# 3. Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
#select * from bank.client where Education = 'high' order by LastName;

# 4. Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
#SELECT * FROM bank.application order by idApplication desc limit 5;

# 5. Вивести усіх клієнтів, чиє прізвище закінчується на iv чи riv.
#select * from bank.client where LastName like '%iv' or LastName like '%riv';
# 6. Вивести клієнтів банку, які обслуговуються київськими відділеннями.
#select * from bank.client where Department_idDepartment = 1 or Department_idDepartment = 4;

# 7. Вивести імена клієнтів та їхні номера паспорта, погрупувавши їх за іменами.
#select FirstName, Passport
#from bank.client
#group by FirstName;

# 8. Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
#select FirstName, LastName, Passport, City, Age, application.Sum
#from bank.client
  #join bank.application
    #on client.idClient = application.Client_idClient
        #where Sum > 5000;

# 9. Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
#select count(idClient) from bank.client;
#select count(idClient) from bank.client where Department_idDepartment = 2 or Department_idDepartment = 5;

# 10.  Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
#select max(Sum), Client_idClient
#from bank.application
#group by Client_idClient;

# 11.  Визначити кількість заявок на кредит для кожного клієнта.
#select count(idApplication), Client_idClient
  #from bank.application
    #group by Client_idClient;

# 12.  Визначити найбільший та найменший кредити.
#select max(Sum) from bank.application;
#select min(Sum) from bank.application;

# 13.  Порахувати кількість кредитів для клієнтів, які мають вищу освіту.

-- select count(idApplication) as CounApp, c.Education
--   from application a
--     join client c on a.Client_idClient = c.idClient
--         where Education = 'high';

# 14.  Вивести дані про клієнта, в якого середня сума кредитів найвища.
#select avg(Sum) as AvgSum, client.FirstName, client.LastName, client.idClient
 #from application
  #join client  on application.Client_idClient = client.idClient
    #group by idClient
    #order by AvgSum desc limit 1;

# 15.  Вивести відділення, яке видало в кредити найбільше грошей.

#select sum(Sum) as MaxSum, d.DepartmentCity
  #from application a
    #join client c on a.Client_idClient = c.idClient
        #join department d on c.Department_idDepartment = d.idDepartment
        #group by DepartmentCity
        #order by MaxSum desc limit 1;

# 16.  Вивести відділення, яке видало найбільший кредит.

#select max(Sum) as MaxSum, d.DepartmentCity
  #from application a
    #join client c on a.Client_idClient = c.idClient
        #join department d on c.Department_idDepartment = d.idDepartment;

# 17.  Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.

-- update application a
--     join client c on a.Client_idClient = c.idClient
--     set a.Sum = 6000
--     where c.Education = 'high';

# 18.  Усіх клієнтів київських відділень пересилити до Києва.

-- update client c
--   join department d on c.Department_idDepartment = d.idDepartment
--     set City = 'Kyiv'
--     where DepartmentCity = 'Kyiv';

# 19.  Видалити усі кредити, які є повернені.

#delete from application where CreditState = 'Returned';

# 20.  Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

-- delete from application a
--   join client c on a.Client_idClient = c.idClient
--     where LastName like '_a%' or LastName like '_e%' or LastName like '_i%' or LastName like '_o%' or LastName like '_u%';

# 21.  Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000.

select sum(Sum) as summ
from department
         join client on idDepartment = Department_idDepartment
         join application on idClient = Client_idClient
where DepartmentCity = 'Lviv'
group by idDepartment
having summ > 5000;
select idDepartment, FirstName, LastName, DepartmentCity, Sum
from department
         inner join client
         inner join application
                    on department.idDepartment = Department_idDepartment and
                       client.idClient = Client_idClient
where department.DepartmentCity = 'Lviv'
  and Sum > 5000;

# 22.  Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000.

#select Sum, c.idClient, c.FirstName, c.LastName
  #from application a
    #join client c on a.Client_idClient = c.idClient
  #where CreditState = 'Returned' and Sum > 5000
    #group by idClient;

# 23.  Знайти максимальний неповернений кредит.

#select max(Sum) from application where CreditState = 'Not returned';

# 24.  Знайти клієнта, сума кредиту якого найменша.

-- select min(Sum) as MinSum, c.idClient, c.FirstName, c.LastName
--   from application a
--     join client c on a.Client_idClient = c.idClient
--         group by idClient
--         order by MinSum limit 1;

# 25.  Знайти кредити, сума яких більша за середнє значення усіх кредитів.

#select * from application where Sum > (select avg(Sum) from application);

# 26.  Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів.
select distinct idClient,
                FirstName,
                LastName,
                Education,
                Passport,
                City,
                Age,
                Department_idDepartment,
                Client_idClient
    from client
    join application on client.idClient = application.Client_idClient
    where client.City like (select City
                                from client
                                join application on client.idClient = application.Client_idClient
                                group by idClient
                                order by count(idApplication) desc
                                limit 1);

# 27.  Max sum.

-- select max(Sum) from application;

# 28.  Місто чувака який набрав найбільше кредитів.
-- select count(idApplication) as MaxAp, c.City
--   from application a
--     join client c on a.Client_idClient = c.idClient
-- group by Client_idClient
-- order by MaxAp desc limit 1;
