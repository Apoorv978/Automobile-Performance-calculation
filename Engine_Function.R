#Calculation formulas

#output Torque
out_torque<-function(load,dynamometer_length) # Load applied, Dynamometer length
  return(load*dynamometer_length*9.81*0.001)  # in N-m

brake_pow <- function(out_torque,rpm)
  return(out_torque*2*3.1415*rpm/60)  # in Watt

indic_pow <- function(ip)
  return(ip*1000)

fric_pow <- function(ip,bp)
  return((ip*1000) - bp)     # in Watt

bmep <- function(bp, rpm, bore, stroke_lt, cylinders)
  return((((bp * 60 * 2 * 4) / (
    3.1415 * rpm * (bore^2) * stroke_lt * cylinders / (10^9))))/(1.013*(10^5)))  #in bar

imep <- function(ip, rpm, bore, stroke_lt, cylinders)
  return((((ip*1000 * 60 * 2 * 4) / (
    3.1415 * rpm * (bore^2) * stroke_lt * cylinders / (10^9))))/(1.013*(10^5)))  #in bar

bte <- function(bp, v_fuel, den_fuel, cv_fuel)
  return((bp * 60 / (v_fuel * den_fuel * cv_fuel / 1000))*100)   # in %

ite <- function(ip, v_fuel, den_fuel, cv_fuel)
  return((ip* 1000 * 60 / (v_fuel * den_fuel * cv_fuel / 1000))*100)   # in %

mech_eff <- function(bp,ip)
  return((bp/(ip*1000))*100)       # in %

air_flow <- function(air_height,Cd,dia_orifice)
  return(Cd*((2*9.81*air_height/1.17)^0.5)*1.17*3.145*(dia_orifice^2)*(10^-6)*3600*0.25)  #in kg/hr

fuel_flow <- function(v_fuel, den_fuel)
  return(v_fuel * (10^-6) * 60 * den_fuel)  #in kg/hr

bsfc <- function(fuel_flow,bp)
  return(fuel_flow / (bp / 1000))          #in kg/KW-hr

isfc <- function(fuel_flow,ip)
  return(fuel_flow/ip)              #in kg/KW-hr

volumetric_eff <- function(ar_flow,bore,stroke_lt,rpm)
  return((ar_flow*800*(10^9))/(1.17*3.1415*(bore^2)*stroke_lt*rpm*60))  # in %

exhaust_loss <- function(v_water_cal, fuel_flow, cv_fuel, t3, t4, t5, t6)
  return((v_water_cal * 4.186 * (t4 - t3) * (t5 - 29) / (fuel_flow * cv_fuel * (t5 - t6)))*100)      # in %

heat_loss <- function(v_water_engine, fuel_flow, cv_fuel, t1, t2)
  return((v_water_engine * 4.186 * (t2 - t1) / (fuel_flow * cv_fuel))*100)

total_loss <- function(brk_loss,exh_loss,ht_loss)
  return(brk_loss+exh_loss+ht_loss)