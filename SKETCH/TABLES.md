```sql
create table Course(
    name varchar(30) primary key not null,
    concluded int not null,
    hours integer not null
);
```

```sql
create table Semester(
    num integer primary key not null,
    totalHours integer not null
);
```

```sql
create table Student(
    name varchar(30) primary key not null
);
```