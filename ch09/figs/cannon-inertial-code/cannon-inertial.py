#%\footnote{A standard baseball is supposed to have a circumference
#%        of $9\frac{1}{8}$ inches. A standard way of paramerizing the force of fluid friction is $F=(1/2)\rho AC_D v^2$, where $\rho$ is
#%        the density of the fluid, $A$ is the object's cross-sectional area, and $C_D$ is a unitless constant. E. Meyer and
#%        J. Bohn, in a 2008 paper published at arxiv.org, survey existing data on $C_D$ for baseballs and estimate it to be in the range
#%        from about 0.13 to 0.5. This leads to a figure something like the one given.} 

import math
def sim(y0,v,m,r,theta,atm,dt):
  # theta = angle at which it's hit, in degrees
  # dt    = amount of time for each step
  # atm = pressure in units of atmospheres
  rr = r/(3.6888) # radius relative to a baseball
  c = 0.0007 # from baseball data
  k = atm*rr*rr*c
  g=9.8 # gravitational field
  t=0
  # Built-in trig functions want radians:
  radians = theta*math.pi/180. 
  vx = v*math.cos(radians)
  vy = v*math.sin(radians)
  v0y = vy
  x = 0
  y = y0
  for i in range(1000000):
    # ... actually we hit the ground before 1000000
    t = t + dt
    x = x + vx*dt
    y = y + vy*dt
    yff = v0y*t-.5*g*t*t
    if i%4==0:
      #print t,",",x,",",y
      print t,",",-y,",",y-yff
    if yff<0 :  # hit the ground
      return x
    v = math.sqrt(vx*vx+vy*vy)
    radians = math.atan(vy/vx)
    f_air = k*v*v
    f_grav = m*g
    fx = -f_air*math.cos(radians)
    fy = -f_air*math.sin(radians)-f_grav
    ax = fx/m
    ay = fy/m
    vx = vx + ax*dt
    vy = vy + ay*dt

v = 44.555 # for baseball, 45. gives a distance that is roughly a home run

if 1: # home-run baseball, optimized angle, but steel ball bearing
  y0 = 0.  # height from which it's hit
  r = 2 # radius in cm
  density = 8*0.001 # typical density of steel, 8 g/cm3, converted to kg/cm3
  m = (4.0/3.0)*(3.14159)*r*r*r*density
  theta = 40.0 # angle in degrees

sim(y0,v,m,r,theta,1.0,.01)
