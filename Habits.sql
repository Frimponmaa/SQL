-- Create the database
CREATE Schema HabitTrackerDB4;
USE HabitTrackerDB4;

-- Create the User table
CREATE TABLE User (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    location VARCHAR(100)
);

-- Create the Habit table
CREATE TABLE Habit (
    habitID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    habitName VARCHAR(100),
    isCompleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (userID) REFERENCES User(userID) ON DELETE CASCADE
);

-- Create the Goal table
CREATE TABLE Goal (
    goalID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    goalName VARCHAR(100),
    FOREIGN KEY (userID) REFERENCES User(userID) ON DELETE CASCADE
);

-- Create the Habit_Goal table
CREATE TABLE Habit_Goal (
    habitID INT,
    goalID INT,
    PRIMARY KEY (habitID, goalID),
    FOREIGN KEY (habitID) REFERENCES Habit(habitID) ON DELETE CASCADE,
    FOREIGN KEY (goalID) REFERENCES Goal(goalID) ON DELETE CASCADE
);

-- Create the Business_Data table with the subscriptionDate column
CREATE TABLE Business_Data (
    recordID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    subscriptionType VARCHAR(50),
    price DECIMAL(10, 2),
    subscriptionMonths INT,
    subscriptionDate DATE,
    FOREIGN KEY (userID) REFERENCES User(userID) ON DELETE CASCADE
);


-- Insert sample data into User table
INSERT INTO User (userName, age, gender, location) VALUES
('Alice Johnson', 28, 'Female', 'New York'),
('Bob Smith', 34, 'Male', 'Los Angeles'),
('Charlie Brown', 40, 'Male', 'Chicago'),
('Diana Prince', 25, 'Female', 'San Francisco'),
('Eve Adams', 30, 'Female', 'Seattle'),
('Zoe Martinez', 22, 'Female', 'Austin'),
('Franklin White', 45, 'Male', 'Austin'),
('Grace Hall', 29, 'Female', 'Boston'),
('Henry Lewis', 33, 'Male', 'San Diego'),
('Isabella Wilson', 27, 'Female', 'Denver'),
('Jack Lee', 38, 'Male', 'Philadelphia'),
('Katherine Clark', 31, 'Female', 'Houston'),
('Liam Brown', 26, 'Male', 'Miami'),
('Mia Taylor', 29, 'Female', 'Orlando'),
('Noah Harris', 32, 'Male', 'Atlanta'),
('Olivia Lewis', 24, 'Female', 'Dallas'),
('Paul Walker', 37, 'Male', 'Seattle'),
('Quinn Scott', 28, 'Female', 'San Francisco'),
('Ryan Young', 41, 'Male', 'Chicago'),
('Sophia Allen', 25, 'Female', 'Los Angeles'),
('Tom Johnson', 34, 'Male', 'New York'),
('Uma Patel', 30, 'Female', 'San Diego'),
('Victor Martin', 39, 'Male', 'Philadelphia'),
('Wendy Anderson', 27, 'Female', 'Austin'),
('Xander King', 36, 'Male', 'Denver'),
('Yara Thomas', 31, 'Female', 'Boston'),
('Zoe Martinez', 22, 'Female', 'Austin');

-- Insert sample data into Habit table
INSERT INTO Habit (userID, habitName, isCompleted) VALUES
(1, 'Morning Jog', TRUE),
(1, 'Read a Book', FALSE),
(1, 'Meditation', TRUE),
(2, 'Go to Gym', TRUE),
(2, 'Cook Healthy Meal', FALSE),
(2, 'Learn Guitar', TRUE),
(3, 'Write Blog', TRUE),
(3, 'Travel', FALSE),
(3, 'Study', TRUE),
(4, 'Yoga', TRUE),
(5, 'Swim 3 Times a Week', TRUE),
(5, 'Learn Spanish', FALSE),
(6, 'Read Daily', TRUE),
(6, 'Attend Workshops', TRUE),
(7, 'Practice Piano', TRUE),
(7, 'Watch Educational Videos', FALSE),
(8, 'Run 10km', TRUE),
(8, 'Practice Meditation', TRUE),
(9, 'Join a Club', TRUE),
(9, 'Attend Social Events', TRUE),
(10, 'Cook Healthy', FALSE),
(10, 'Exercise Weekly', TRUE),
(11, 'Write Journal', TRUE),
(11, 'Explore Nature', TRUE),
(12, 'Learn Python', TRUE),
(12, 'Meditate Daily', FALSE),
(13, 'Finish Online Courses', TRUE),
(13, 'Attend Webinars', TRUE),
(14, 'Complete Fitness Program', TRUE),
(14, 'Travel More', TRUE),
(15, 'Watch Motivational Videos', TRUE),
(15, 'Read 5 Books', FALSE);

-- Insert sample data into Goal table
INSERT INTO Goal (userID, goalName) VALUES
(1, 'Lose Weight'),
(1, 'Read 12 Books'),
(2, 'Build Muscle'),
(2, 'Improve Cooking Skills'),
(3, 'Improve Writing Skills'),
(3, 'Visit 5 Countries'),
(4, 'Increase Flexibility'),
(5, 'Improve Cardiovascular Health'),
(5, 'Master a New Language'),
(6, 'Enhance Professional Skills'),
(6, 'Attend 5 Industry Events'),
(7, 'Learn a New Musical Instrument'),
(7, 'Watch 50 Educational Videos'),
(8, 'Complete a Marathon'),
(8, 'Master Meditation Techniques'),
(9, 'Participate in Community Events'),
(9, 'Develop Networking Skills'),
(10, 'Adopt a Healthier Diet'),
(10, 'Increase Physical Activity'),
(11, 'Maintain a Daily Journal'),
(11, 'Experience Outdoor Adventures'),
(12, 'Become Proficient in Python'),
(12, 'Establish a Meditation Routine'),
(13, 'Achieve Fitness Goals'),
(13, 'Travel to New Destinations'),
(14, 'Reach Personal Milestones'),
(14, 'Expand Travel Horizons'),
(15, 'Consume Inspirational Content'),
(15, 'Achieve Reading Goals');

-- Insert sample data into Habit_Goal table
INSERT INTO Habit_Goal (habitID, goalID) VALUES
(1, 1), (2, 2), (3, 1), 
(4, 3), (5, 4),
(6, 2), (7, 5),
(8, 6),
(9, 7),
(10, 8), (11, 9),
(12, 10), (13, 11),
(14, 12), (15, 13),
(16, 14), (17, 15),
(18, 16), (19, 17),
(20, 18), (21, 19),
(22, 20), (23, 21),
(24, 22), (25, 23),
(26, 24), (27, 25);

INSERT INTO Business_Data (userID, subscriptionType, price, subscriptionMonths, subscriptionDate) VALUES 
-- Users with changing subscriptions
(1, 'Premium', 29.99, 6, '2023-01-10'), 
(1, 'Basic', 9.99, 3, '2023-07-15'), 
(3, 'Premium', 29.99, 6, '2023-03-05'), 
(3, 'Standard', 19.99, 9, '2023-04-10'), 
(3, 'Basic', 9.99, 12, '2023-05-15'), 
(5, 'Standard', 19.99, 3, '2023-06-20'), 
(5, 'Premium', 29.99, 12, '2023-07-25'), 
(7, 'Basic', 9.99, 3, '2024-01-10'), 
(7, 'Standard', 19.99, 6, '2024-02-20'), 
(7, 'Premium', 29.99, 9, '2024-03-05'), 
(9, 'Basic', 9.99, 1, '2024-07-25'), 
(9, 'Premium', 29.99, 12, '2024-08-30'), 
(9, 'Standard', 19.99, 6, '2024-09-10'),
-- Users with no change in subscription
(2, 'Standard', 19.99, 12, '2023-02-20'),
(2, 'Standard', 19.99, 12, '2024-02-20'),
(4, 'Premium', 29.99, 12, '2023-03-15'),
(4, 'Premium', 29.99, 12, '2024-03-15'),
(6, 'Basic', 9.99, 12, '2023-04-10'),
(6, 'Basic', 9.99, 12, '2024-04-10'),
(8, 'Standard', 19.99, 12, '2023-05-15'),
(8, 'Standard', 19.99, 12, '2024-05-15'),
(10, 'Premium', 29.99, 12, '2023-06-20'),
(10, 'Premium', 29.99, 12, '2024-06-20');


-- Find the number of goals per user
SELECT 
    u.userID,  -- The unique identifier for each user
    u.userName,  -- The name of each user
    COUNT(DISTINCT g.goalID) AS number_of_goals  -- Count of distinct goals for each user
FROM 
    User u  -- Table containing user information
JOIN 
    Goal g ON u.userID = g.userID  -- Join with Goal table to link users to their goals
GROUP BY 
    u.userID, u.userName  -- Group by user to aggregate goal count
ORDER BY 
    number_of_goals DESC;  -- Order by number of goals in descending order

-- Calculate the number of completed goals for each user
-- A goal is considered completed if all associated habits are completed
SELECT 
    u.userID,  -- The unique identifier for each user
    u.userName,  -- The name of each user
    COUNT(DISTINCT g.goalID) AS completed_goals  -- Count of distinct completed goals for each user
FROM 
    User u  -- Table containing user information
JOIN 
    Goal g ON u.userID = g.userID  -- Join with Goal table to link users to their goals
JOIN 
    Habit_Goal hg ON g.goalID = hg.goalID  -- Join with Habit_Goal to link goals to their associated habits
JOIN 
    Habit h ON hg.habitID = h.habitID  -- Join with Habit table to get the completion status of habits
GROUP BY 
    u.userID, u.userName  -- Group by user to aggregate goal completion status
HAVING 
    COUNT(CASE WHEN h.isCompleted = FALSE THEN 1 ELSE NULL END) = 0  -- Include only users where all associated habits are completed
ORDER BY 
    completed_goals DESC;  -- Order by number of completed goals in descending order

-- Count users by location and age group
SELECT 
    u.location,  -- The location of the users
    CASE 
        WHEN u.age BETWEEN 18 AND 24 THEN '18-24'
        WHEN u.age BETWEEN 25 AND 34 THEN '25-34'
        WHEN u.age BETWEEN 35 AND 44 THEN '35-44'
        WHEN u.age BETWEEN 45 AND 54 THEN '45-54'
        WHEN u.age >= 55 THEN '55+'
        ELSE 'Unknown'
    END AS age_group,  -- Categorize users into age groups
    COUNT(u.userID) AS user_count  -- Count of users in each location and age group
FROM 
    User u  -- Table containing user information
GROUP BY 
    u.location, age_group  -- Group by location and age group
ORDER BY 
	user_count desc,u.location;  -- Order results by location and user_count

-- Count the number of users by age
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age >= 55 THEN '55+'
        ELSE 'Unknown'
    END AS age_range,  -- Categorize users into age ranges
    COUNT(userID) AS user_count  -- Count the number of users in each age range
FROM 
    User  -- Table containing user information
GROUP BY 
    age_range  -- Group by age range to get counts
ORDER BY 
    user_count DESC;  -- Order by user count in descending order


-- Calculate the completion rate of habits for each user
SELECT 
    u.userID,  -- The unique identifier for each user
    u.userName,  -- The name of each user
    COUNT(h.habitID) AS total_habits,  -- Total number of habits for each user
    SUM(CASE WHEN h.isCompleted = TRUE THEN 1 ELSE 0 END) AS completed_habits,  -- Count of completed habits
    ROUND(SUM(CASE WHEN h.isCompleted = TRUE THEN 1 ELSE 0 END) / COUNT(h.habitID) * 100, 2) AS completion_rate  -- Completion rate as a percentage
FROM 
    User u  -- Table containing user information
JOIN 
    Habit h ON u.userID = h.userID  -- Join with Habit table to get habits for each user
GROUP BY 
    u.userID, u.userName  -- Group by user to aggregate habit completion data
ORDER BY 
    completion_rate DESC;  -- Order by completion rate in descending order

-- Find habits that are associated with the most goals
SELECT 
    h.habitID,  -- The unique identifier for each habit
    h.habitName,  -- The name of each habit
    COUNT(hg.goalID) AS goal_count  -- Count of goals associated with each habit
FROM 
    Habit h  -- Table containing habits
JOIN 
    Habit_Goal hg ON h.habitID = hg.habitID  -- Join with Habit_Goal to link habits to goals
GROUP BY 
    h.habitID, h.habitName  -- Group by habit to get count of associated goals
ORDER BY 
    goal_count DESC;  -- Order by number of associated goals in descending order

-- Find which goals are associated with the most habits and list each habit name
SELECT 
    g.goalID,  -- The unique identifier for each goal
    g.goalName,  -- The name of each goal
    h.habitName,  -- The name of each habit associated with the goal
    COUNT(hg.habitID) AS habit_count  -- Count of habits associated with each goal
FROM 
    Goal g  -- Table containing goals
JOIN 
    Habit_Goal hg ON g.goalID = hg.goalID  -- Join with Habit_Goal to link goals with habits
JOIN 
    Habit h ON hg.habitID = h.habitID  -- Join with Habit table to get habit names
GROUP BY 
    g.goalID, g.goalName, h.habitName  -- Group by goal and habit to get counts for each combination
ORDER BY 
    habit_count DESC;  -- Order by number of associated habits in descending order

-- Get statistics on goal achievement including habit names
SELECT 
    g.goalID,  -- The unique identifier for each goal
    g.goalName,  -- The name of each goal
    GROUP_CONCAT(DISTINCT h.habitName ORDER BY h.habitName SEPARATOR ', ') AS habit_names,  -- List of habit names associated with each goal
    COUNT(DISTINCT hg.habitID) AS associated_habits,  -- Count of unique habits associated with each goal
    COUNT(DISTINCT u.userID) AS users_working_on_goal  -- Count of unique users working on the goal
FROM 
    Goal g  -- Table containing goals
JOIN 
    Habit_Goal hg ON g.goalID = hg.goalID  -- Join with Habit_Goal to link goals with habits
JOIN 
    Habit h ON hg.habitID = h.habitID  -- Join with Habit table to get habit names
JOIN 
    User u ON h.userID = u.userID  -- Join with User table to count users working on the goal
GROUP BY 
    g.goalID, g.goalName  -- Group by goal to aggregate achievement statistics
ORDER BY 
    associated_habits DESC;  -- Order by number of associated habits in descending order

-- List habits and the goals they are linked to
SELECT 
    h.habitID,  -- The unique identifier for each habit
    h.habitName,  -- The name of each habit
    g.goalID,  -- The unique identifier for each goal linked to the habit
    g.goalName  -- The name of each goal linked to the habit
FROM 
    Habit_Goal hg  -- Table linking habits and goals
JOIN 
    Habit h ON hg.habitID = h.habitID  -- Join with Habit table to get habit details
JOIN 
    Goal g ON hg.goalID = g.goalID  -- Join with Goal table to get goal details
ORDER BY 
    h.habitID, g.goalID;  -- Order by habit and goal IDs

-- Analyze revenue trends on a monthly basis
SELECT 
    subscriptionType,
    DATE_FORMAT(subscriptionDate, '%Y-%m') AS month,  -- Format date to 'Year-Month'
    SUM(price * subscriptionMonths) AS totalRevenue
FROM 
    Business_Data
GROUP BY 
    subscriptionType, month
ORDER BY 
    month ASC, subscriptionType;

    Select * from Business_Data;
    
    


