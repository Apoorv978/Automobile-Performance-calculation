#Masking variables

engine$LOAD..kg.->Load
engine$Indicated.Power..Ip..value..kw.->IP
engine$FUEL..ml.min.->Fuel_flow_rate
engine$AIR..mm.of.water.-> Air_flow_rate
engine$CALORIMETER.WATER.FLOW..lph.-> cal_water_flow
engine$ENGINE.WATER.FLOW..lph.-> eng_water_flow
engine$T1...C.-> T1
engine$T2...C.-> T2
engine$T3...C.-> T3
engine$T4...C.-> T4
engine$T5...C.-> T5
engine$T6...C.-> T6

#Masking constants

constants$No..of.cylinders -> no._of_cylinders
constants$Compression.Ratio -> Comp_Ratio
constants$Calorific.value.of.Fuel.KJ.Kg. -> cv_fuel
constants$Fuel.Density.Kg.m.3. -> fuel_density
dia_orifice <- constants$Diameter.of.Air.Intake.Orifice.mm.
Cd <- constants$Orifice.co.efficient.of.discharge
bore <- constants$Bore.mm.
stroke_lt <- constants$Stroke.Length.mm.
Dynamometer_lt <- constants$Dynamometer.arm.Length.mm.
