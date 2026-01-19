-- this is a comment in Lua

local name = "Sam";

function sayHello()
    return "Hello "..name;
end;

print(sayHello());

local numbers = {
    0, 1, 2, 3
};

-- use pairs() around the variable to make key-value pairs
for index, n in pairs(numbers) do
    print("Index is "..index)
    print("Number is "..n)
end;

local person = {
    name = "Sam",
    location = "UK"
};

print(person.name.." is based in "..person.location);

local Person = {
    status = "Alive";
};

-- self referencing Person runs a lot of underlying details
Person.__index = Person;

--Function to add a new person to the Person object
function Person.new(name, age)
    local newPerson = {
        name = name,
        age = age
    };

    -- Set Person within the Person metatable
    setmetatable(newPerson, Person);

    return newPerson;
end;

--A method on an object to run something, in this case make them age by 1
function Person:haveBirthday()
    self.age = self.age +1;
end;

local Steve = Person.new("Steve", 41);
local Kevin = Person.new("Kevin", 48);

print(Kevin.name.." and "..Steve.name.." are best friends.");
print(Kevin.name.." is "..Kevin.age.." years old!");

Kevin:haveBirthday();
print(Kevin.name.." is "..Kevin.age.." years old!");

local people = {Kevin, Steve};
local Garen = Person.new("Garen", 100);

--In built table methods for adding and remove a variable from a table (object)
table.insert(people, Garen);
table.remove(people, 1);

for index, person in pairs(people) do
    print(person.name);
end;



