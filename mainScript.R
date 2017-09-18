# Code for Calculating the standard engine perfomance parameters:

setwd("C:/Users/aapoo/Desktop/R Programming work/Auto Lab coding work")

#Choosing which engine we are working
engine_name <- readline(prompt = "Which engine we are working on? ")
engine.df <- read.csv((paste0(engine_name,".csv")),sep = ",")
engine.df <- engine.df[complete.cases(engine.df),]
View(engine.df)

#Loading all the performance parameters calculating functions
source('./Engine_Function.R')

#Loading constants of Engine we are working on 
engine_const <- read.csv(paste("Engine_constants.csv"),sep = ",")
constants <- engine_const[engine_const["Engine"]==paste(engine_name),]
attach(constants)
View(constants)

#Choosing which Group data we are working with
grp_number <- readline(prompt = "Team No: ")
as.integer(grp_number)
engine <- engine.df[engine.df["Group.No."]==grp_number,]
View(engine)
attach(engine)
source('./Masking_variables.R')

#output Torque:
output_torque <- out_torque(Load,Dynamometer_lt)          # in N-m

#Brake Power: 
brake_power <- brake_pow(output_torque,RPM)               # in Watts

#Indicated Power:
indicated_power <- indic_pow(IP)                          # in Watts

#Friction Power:
friction_power <- fric_pow(IP,brake_power)                # in Watts

#Brake Mean Effective Pressure
BMEP <- bmep(brake_power,RPM,bore,stroke_lt,no._of_cylinders)   # in bar

#Indicated Mean Effective Pressure
IMEP <- imep(IP,RPM,bore,stroke_lt,no._of_cylinders)            # in bar

#Brake thermal efficency
Brake_th_eff <- bte(brake_power,Fuel_flow_rate,fuel_density,cv_fuel)     # in percentage

#Indicated thermal efficency
Ind_th_eff <- ite(IP,Fuel_flow_rate,fuel_density,cv_fuel)                # in percentage

#Mechanical Efficency
mech_th_eff <- mech_eff(brake_power,IP)                                  # in percentage

#Air flow rate
Air_flow <- air_flow(Air_flow_rate,Cd,dia_orifice)                       # in kg/hr

#Fuel Flow rate                                                          
Fl_flow <- fuel_flow(Fuel_flow_rate,fuel_density)                        # in kg/hr

#Brake specific fuel consumption 
BSFC <- bsfc(Fl_flow,brake_power)                                        # in kg/kW-hr

#Indicated specific fuel consumption
ISFC <- isfc(Fl_flow,IP)                                                 # in kg/kW-hr

#Volumetric Efficiency 
vol_eff <- volumetric_eff(Air_flow,bore,stroke_lt,RPM)                   # in percentage

#Brake loss 
brk_loss <- Brake_th_eff                                                 # in percentage

#Exhaust losses
Exh_loss <- exhaust_loss(cal_water_flow,Fl_flow,cv_fuel,T3,T4,T5,T6)     # in percentage

#Heat loss
Ht_loss <- heat_loss(eng_water_flow,Fl_flow,cv_fuel,T1,T2)               # in percentage

#Total Energy loss 
tot_loss <- total_loss(Brake_th_eff,Exh_loss,Ht_loss)                    # in percentage

#Presenting data in tabular format
solution_table <- rbind("Output Torque(in N-m)"=output_torque,"Brake Power(in Watts)"=brake_power,"Indicated Power(in Watts)"=indicated_power,"Friction Power(in Watts)"=friction_power,"Brake Mean Effective Pressure(in bar)"=BMEP,"Indicated Mean Effective Pressure(in bar)"=IMEP,"Brake thermal efficiency(in %)"=Brake_th_eff,"Indicated thermal efficiency(in %)"=Ind_th_eff,"Mechanical thermal efficiency(in %)"=mech_th_eff,"Air flow rate(in kg/hr)"=Air_flow,"Fuel flow rate(in kg/hr)"=Fl_flow,"Brake specific fuel consumption(in kg/kW-hr)"=BSFC,"Indicated specific fuel consumption(in kg/kW-hr)"=ISFC,"Volumetric Efficiency(in %)"=vol_eff,"Brake loss as % heat input(in %)"=brk_loss,"Exhaust loss as % heat input(in %)"=Exh_loss,"Heat loss cooling as % heat input(in %)"=Ht_loss,"Total Energy loss(in %)"=tot_loss)
colnames(solution_table)<- c("For Load 1", "For Load 2")
print(solution_table)