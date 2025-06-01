-- Thêm ràng buộc NOT NULL vào cột PhoneNumber trong bảng Customers
ALTER TABLE Customers
ALTER COLUMN PhoneNumber VARCHAR(10) NOT NULL;

-- Thêm ràng buộc NOT NULL vào cột Address trong bảng Employees
ALTER TABLE Employees
ALTER COLUMN Address VARCHAR(200) NOT NULL;

-- Thêm ràng buộc UNIQUE vào cột PhoneNumber trong bảng Customers
ALTER TABLE Customers
ADD CONSTRAINT UC_CustomerPhone UNIQUE (PhoneNumber);

-- Thêm ràng buộc CHECK vào cột Gender trong bảng Employees
ALTER TABLE Employees
ADD CONSTRAINT CHK_EmployeeGender CHECK (Gender IN ('M', 'F'));

-- Thêm ràng buộc FOREIGN KEY vào cột CinemaID trong bảng Managers
ALTER TABLE Managers
ADD CONSTRAINT FK_Manager_Cinema FOREIGN KEY (CinemaID) REFERENCES Cinemas(CinemaID);
