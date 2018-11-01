#loading library
library(MDPtoolbox)

#UP Action
up=matrix(c( 1, 0, 0, 0,
             0.7, 0.2, 0.1, 0,
             0, 0.1, 0.2, 0.7,
             0, 0, 0, 1),
          nrow=4,ncol=4,byrow=TRUE)

#Down Action
down=matrix(c(0.3, 0.7, 0, 0,
              0, 0.9, 0.1, 0,
              0, 0.1, 0.9, 0,
              0, 0, 0.7, 0.3),
            nrow=4,ncol=4,byrow=TRUE)

#Left Action
left=matrix(c( 0.9, 0.1, 0, 0,
               0.1, 0.9, 0, 0,
               0, 0.7, 0.2, 0.1,
               0, 0, 0.1, 0.9),
            nrow=4,ncol=4,byrow=TRUE)

#Right Action
right=matrix(c( 0.9, 0.1, 0, 0,
                0.1, 0.2, 0.7, 0,
                0, 0, 0.9, 0.1,
                0, 0, 0.1, 0.9),
             nrow=4,ncol=4,byrow=TRUE)

#Combined Actions matrix
Actions=list(up=up, down=down, left=left, right=right)

#Defining the rewards and penalties
Rewards=matrix(c( -1, -1, -1, -1,
                  -1, -1, -1, -1,
                  -1, -1, -1, -1,
                  10, 10, 10, 10),
               nrow=4,ncol=4,byrow=TRUE)
#navigator
solver=mdp_policy_iteration(P=Actions, R=Rewards, discount = 0.1)
solver
#getting the policy
solver$policy
names(Actions)[solver$policy]

#geting single step values
solver$V

#getting iterations
solver$iter

#getting run time
solver$time
#====================================================
#getting reinforcementlearning/brute force
library(devtools)
#install_github("nproellochs/ReinforcementLearning")
library(ReinforcementLearning)
gridworldEnvironment

# Define names for state and action
states <- c("s1", "s2", "s3", "s4")
actions <- c("up", "down", "left", "right")

# Generate 1000 iterations
sequences <- sampleExperience(N = 10000, env = gridworldEnvironment, states = states, actions = actions)

#Solve the problem
solver_rl <- ReinforcementLearning(sequences, s = "State", a = "Action", r = "Reward", s_new = "NextState")
solver_rl
solver_rl$Policy
#==================================================================================
data("tictactoe")
modeltt=ReinforcementLearning(tictactoe,s="State",a="Action",r = "Reward", s_new = "NextState", iter = 1)
modeltt$Policy
modeltt$time
