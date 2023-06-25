# Part 1: Defining functions and global variables
# Set up output log and timer
log_data <- data.frame(Sys.time(), "START")
start_time <- proc.time()

# Function to generate random numbers.
gen_rand <- function(min, max)
{
  random <- round(runif(1, min, max))
  return(random)
}

# Function to generate random names.
gen_name <- function(prefix)
{
  letter1 <- sample(LETTERS,1)
  letter2 <- sample(LETTERS,1)
  number <- gen_rand(100,999)
  name <- paste(prefix, letter1, letter2, number, sep="")
  return(name)
}

# Global variables
client_count <- 200
client_list <- NULL

# Part 2: Generating a list of clients
for (i in 1:client_count) {
  # Generate a random name
  name <- gen_name("C")
  
  # Generate a random email address
  email <- paste(name, "@example.com", sep="")
  
  # Generate a random age
  age <- gen_rand(18,99)
  
  # Append the new client to the list
  client_list <- rbind(client_list, 
                       c(name, age, email))
}


# Part 3: Creating a yam (Yoga & Meditation) studio program
# Define the program's details
program_name <- "YAM"
program_intro <- paste("Welcome to the", program_name, 
                       "program! Our program offers classes, ", 
                       "workshops, and retreats to help individuals ",
                       "find inner calm and strength.")

# Define the program's session types
sessions_types <- c("Class", "Workshop", "Retreat")

# Define the program's pricing model
pricing_model <- list(Class = 50,
                      Workshop = 100,
                      Retreat = 500)

# Part 4: Setting up the program schedule
# Define the program's session schedule
session_schedule <- data.frame(Session = character(0),
                               Session_Type = character(0),
                               Start_Date = character(0),
                               End_Date = character(0),
                               stringAsFactors=FALSE)

# Generate the program's session schedule
for (st in sessions_types) {
  session_name <- paste("YAM", st, sep=" ")
  
  # Generate a start and end date
  start_date <- as.Date(Sys.Date())
  end_date <- start_date + gen_rand(7, 28)
  
  # Append the session to the schedule
  session_schedule <- rbind(session_schedule, 
                           c(session_name, st, start_date, end_date))
}

# Part 5: Signing clients up for sessions
# Initialize a list of client sign-ups
client_signups <- data.frame(Client = character(0),
                             Session = character(0),
                             stringAsFactors=FALSE)

# Sign each client up for a random session
for (client in client_list[,1]) {
  # Generate a random session
  session <- sample(session_schedule[,1], 1)
  
  # Append the client sign-up to the list
  client_signups <- rbind(client_signups, 
                          c(client, session))
}


# Part 6: Logging program activity and end time
# Log the program activity
log_data <- rbind(log_data, 
                  c(Sys.time(), 
                    paste("Created", client_count, 
                          "clients and signed them up for", 
                          nrow(session_schedule), 
                          "sessions.")))

# Log the program end time
end_time <- proc.time()
elapsed_time <- end_time - start_time
log_data <- rbind(log_data,
                  c(Sys.time(), 
                    paste("Program complete in", 
                          elapsed_time[3], "seconds.")))

# Print the log
print(log_data)