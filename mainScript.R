# Code for Calculating the standard engine perfomance parameters:

#Kirloskar AV-1(Four Stroke Diesel Engine)
engine.df <- read.csv(paste("Engine_1.csv"),sep = ",")
View(engine.df)
source('./Engine_Function.R')
#output Torque:
attach(engine.df)

output_torque <- out_torque(Load.in.Kg.,Dynamometer.length.in.mm.)

#Brake Power: 
brake_power <- brake_pow(output_torque,RPM)

#Friction Power:
friction_power <- fric_pow(Indicated.Power.Ip..value.KW.,brake_power)

#BMEP
BMEP <- bmep(brake_power,RPM,bore,stroke_lt,'no. of cylinders')

#IMEP
IMEP <- imep(Indicated.Power.Ip..value.KW.,RPM,bore,stroke_lt,'no. of cylinders')

#Brake thermal efficency
Brake_th_eff <- bte(brake_power,v_fuel,fuel_density,cv_fuel)

#Indicated thermal efficency
#Mechanical Efficency
mech_th_eff <- mech_eff(brake_power,Indicated.Power.Ip..value.KW.)

#Fuel Flow rate
Fl_flow <- fuel_flow(Fuel.flow.ml.min.,fuel_density)

#Brake specific fuel consumption
BSFC <- bsfc(Fl_flow,brake_power)

#Indicated specific fuel consumption
ISFC <- isfc(Fl_flow,Indicated.Power.Ip..value.KW.*1000)

#Volumetric Efficency
Vol_effi <- vol_eff(air_flow,bore,stroke_lt,RPM,'no. of cylinders')

#Exhaust losses
Exh_loss <- exhaust_loss(water_cal_value,Fl_flow,cv_fuel,t3,t4,t5,t6)

#Heat loss
Ht_loss <- heat_loss(water_cal_value,Fl_flow,cv_fuel,t1,t2)

