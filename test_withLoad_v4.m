% Add binary variable; Complete all bus constraints.
%% Declare decision variables. 
%% Load Bus
% bus-1
Vp1 = sdpvar(1, 1,'full');
Vn1 = sdpvar(1, 1,'full');
% bus-2
Vp2 = sdpvar(1, 1,'full');
Vn2 = sdpvar(1, 1,'full');
% bus-3
Vp3 = sdpvar(1, 1,'full');
Vn3 = sdpvar(1, 1,'full');
% bus-5
Vp5 = sdpvar(1, 1,'full');
Vn5 = sdpvar(1, 1,'full');
% bus-6
Vp6 = sdpvar(1, 1,'full');
Vn6 = sdpvar(1, 1,'full');
% bus-7
Vp7 = sdpvar(1, 1,'full');
Vn7 = sdpvar(1, 1,'full');
% bus-9
Vp9 = sdpvar(1, 1,'full');
Vn9 = sdpvar(1, 1,'full');
% bus-13
Vp13 = sdpvar(1, 1,'full');
Vn13 = sdpvar(1, 1,'full');
% bus-14
Vp14 = sdpvar(1, 1,'full');
Vn14 = sdpvar(1, 1,'full');
% bus-15
Vp15 = sdpvar(1, 1,'full');
Vn15 = sdpvar(1, 1,'full');
% bus-17
Vp17 = sdpvar(1, 1,'full');
Vn17 = sdpvar(1, 1,'full');
% bus-18
Vp18 = sdpvar(1, 1,'full');
Vn18 = sdpvar(1, 1,'full');
% bus-19
Vp19 = sdpvar(1, 1,'full');
Vn19 = sdpvar(1, 1,'full');
% bus-20
Vp20 = sdpvar(1, 1,'full');
Vn20 = sdpvar(1, 1,'full');
%% IBR bus
% IBR-4
Idp4 = sdpvar(1, 1,'full');Iqp4 = sdpvar(1, 1,'full');
Idn4 = sdpvar(1, 1,'full');Iqn4 = sdpvar(1, 1,'full');
Vp4 = sdpvar(1, 1,'full');
Vn4 = sdpvar(1, 1,'full');
% IBR-8
Idp8 = sdpvar(1, 1,'full');Iqp8 = sdpvar(1, 1,'full');
Idn8 = sdpvar(1, 1,'full');Iqn8 = sdpvar(1, 1,'full');
Vp8 = sdpvar(1, 1,'full');
Vn8 = sdpvar(1, 1,'full');
% IBR-10
Idp10 = sdpvar(1, 1,'full');Iqp10 = sdpvar(1, 1,'full');
Idn10 = sdpvar(1, 1,'full');Iqn10 = sdpvar(1, 1,'full');
Vp10 = sdpvar(1, 1,'full');
Vn10 = sdpvar(1, 1,'full');
% IBR-11
Idp11 = sdpvar(1, 1,'full');Iqp11 = sdpvar(1, 1,'full');
Idn11 = sdpvar(1, 1,'full');Iqn11 = sdpvar(1, 1,'full');
Vp11 = sdpvar(1, 1,'full');
Vn11 = sdpvar(1, 1,'full');
% IBR-12
Idp12 = sdpvar(1, 1,'full');Iqp12 = sdpvar(1, 1,'full');
Idn12 = sdpvar(1, 1,'full');Iqn12 = sdpvar(1, 1,'full');
Vp12 = sdpvar(1, 1,'full');
Vn12 = sdpvar(1, 1,'full');
% IBR-16
Idp16 = sdpvar(1, 1,'full');Iqp16 = sdpvar(1, 1,'full');
Idn16 = sdpvar(1, 1,'full');Iqn16 = sdpvar(1, 1,'full');
Vp16 = sdpvar(1, 1,'full');
Vn16 = sdpvar(1, 1,'full');
% IBR-21
Idp21 = sdpvar(1, 1,'full');Iqp21 = sdpvar(1, 1,'full');
Idn21 = sdpvar(1, 1,'full');Iqn21 = sdpvar(1, 1,'full');
Vp21 = sdpvar(1, 1,'full');
Vn21 = sdpvar(1, 1,'full');
% IBR-22
Idp22 = sdpvar(1, 1,'full');Iqp22 = sdpvar(1, 1,'full');
Idn22 = sdpvar(1, 1,'full');Iqn22 = sdpvar(1, 1,'full');
Vp22 = sdpvar(1, 1,'full');
Vn22 = sdpvar(1, 1,'full');
% IBR-23
Idp23 = sdpvar(1, 1,'full');Iqp23 = sdpvar(1, 1,'full');
Idn23 = sdpvar(1, 1,'full');Iqn23 = sdpvar(1, 1,'full');
Vp23 = sdpvar(1, 1,'full');
Vn23 = sdpvar(1, 1,'full');

% 定义二进制变量
num = 8;
bin1 = binvar(num, 1);
bin2 = binvar(num, 1); 
bin3 = binvar(num, 1); 
bin4 = binvar(num, 1); 
bin5 = binvar(num, 1); 
bin6 = binvar(num, 1); 
bin7 = binvar(num, 1); 
bin8 = binvar(num, 1); 
bin10 = binvar(num, 1);
bin11 = binvar(num, 1);
bin12 = binvar(num, 1);
bin16 = binvar(num, 1);
bin21 = binvar(num, 1); 
bin22 = binvar(num, 1);
bin23 = binvar(num, 1);
Theta_k = (0 : 1 : num-1) * (pi/num); % Normal vector
M = 100000; % big positive number
%% base values
Vbase_LL_rms = 10e3; %10kV RMS line voltage
Vbase = Vbase_LL_rms*sqrt(2/3); % Peak phase voltage
Sbase = 2.5e6;%2.5MW
Ibase = Sbase/(1.5*Vbase);
Zbase = Vbase/Ibase;
% 
Vgp = 0.8*Vbase; phi_p = 0;
% 
Vgn = 0.1*Vbase; phi_n = -pi/2;


Vgdn = Vgn*cos(-phi_n);
Vgqn = Vgn*sin(-phi_n);

Plim = Sbase;
Qlim = Sbase;
Slim = Sbase;
Imax = Ibase;
%% Objective
lambda = 1;
t = ( ...
    (Vn4 /Vbase)^2  + lambda*(Vbase^-1*Vp4  - 1)^2 + ...
    (Vn8 /Vbase)^2  + lambda*(Vbase^-1*Vp8  - 1)^2 + ...
    (Vn10/Vbase)^2  + lambda*(Vbase^-1*Vp10 - 1)^2 + ...
    (Vn11/Vbase)^2  + lambda*(Vbase^-1*Vp11 - 1)^2 + ...
    (Vn12/Vbase)^2  + lambda*(Vbase^-1*Vp12 - 1)^2 + ...
    (Vn16/Vbase)^2  + lambda*(Vbase^-1*Vp16 - 1)^2 + ...
    (Vn21/Vbase)^2  + lambda*(Vbase^-1*Vp21 - 1)^2 + ...
    (Vn22/Vbase)^2  + lambda*(Vbase^-1*Vp22 - 1)^2 + ...
    (Vn23/Vbase)^2  + lambda*(Vbase^-1*Vp23 - 1)^2 ...
    );
%% Constriants
Constraints = [];
%% eq (7)
% Load Bus
% bus-1
Constraints = [Constraints, 0 <= Vn1 <= Vbase];
Constraints = [Constraints, 0 <= Vp1 <= Vbase]; % Vp <= 1pu
% bus-2
Constraints = [Constraints, 0 <= Vn2 <= Vbase];
Constraints = [Constraints, 0 <= Vp2 <= Vbase];
% bus-3
Constraints = [Constraints, 0 <= Vn3 <= Vbase];
Constraints = [Constraints, 0 <= Vp3 <= Vbase];
% bus-5
Constraints = [Constraints, 0 <= Vn5 <= Vbase];
Constraints = [Constraints, 0 <= Vp5 <= Vbase];
% bus-6
Constraints = [Constraints, 0 <= Vn6 <= Vbase];
Constraints = [Constraints, 0 <= Vp6 <= Vbase];
% bus-7
Constraints = [Constraints, 0 <= Vn7 <= Vbase];
Constraints = [Constraints, 0 <= Vp7 <= Vbase];
% bus-9
Constraints = [Constraints, 0 <= Vn9 <= Vbase];
Constraints = [Constraints, 0 <= Vp9 <= Vbase];
% bus-13
Constraints = [Constraints, 0 <= Vn13 <= Vbase];
Constraints = [Constraints, 0 <= Vp13 <= Vbase];
% bus-14
Constraints = [Constraints, 0 <= Vn14 <= Vbase];
Constraints = [Constraints, 0 <= Vp14 <= Vbase];
% bus-15
Constraints = [Constraints, 0 <= Vn15 <= Vbase];
Constraints = [Constraints, 0 <= Vp15 <= Vbase];
% bus-17
Constraints = [Constraints, 0 <= Vn17 <= Vbase];
Constraints = [Constraints, 0 <= Vp17 <= Vbase];
% bus-18
Constraints = [Constraints, 0 <= Vn18 <= Vbase];
Constraints = [Constraints, 0 <= Vp18 <= Vbase];
% bus-19
Constraints = [Constraints, 0 <= Vn19 <= Vbase];
Constraints = [Constraints, 0 <= Vp19 <= Vbase];
% bus-20
Constraints = [Constraints, 0 <= Vn20 <= Vbase];
Constraints = [Constraints, 0 <= Vp20 <= Vbase];
%% IBR bus
% IBR-4
Constraints = [Constraints, 0 <= Vn4 <= Vbase];
Constraints = [Constraints, 0 <= Vp4 <= Vbase]; % Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp4 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp4 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn4 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn4 <= Ibase];
% IBR-8
Constraints = [Constraints, 0 <= Vn8 <= Vbase];
Constraints = [Constraints, 0 <= Vp8 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp8 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp8 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn8 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn8 <= Ibase];
% IBR-10
Constraints = [Constraints, 0 <= Vn10 <= Vbase];
Constraints = [Constraints, 0 <= Vp10 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp10 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp10 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn10 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn10 <= Ibase];
% IBR-11
Constraints = [Constraints, 0 <= Vn11 <= Vbase];
Constraints = [Constraints, 0 <= Vp11 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp11 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp11 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn11 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn11 <= Ibase];
% IBR-12
Constraints = [Constraints, 0 <= Vn12 <= Vbase];
Constraints = [Constraints, 0 <= Vp12 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp12 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp12 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn12 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn12 <= Ibase];
% IBR-16
Constraints = [Constraints, 0 <= Vn16 <= Vbase];
Constraints = [Constraints, 0 <= Vp16 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp16 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp16 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn16 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn16 <= Ibase];
% IBR-21
Constraints = [Constraints, 0 <= Vn21 <= Vbase];
Constraints = [Constraints, 0 <= Vp21 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp21 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp21 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn21 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn21 <= Ibase];
% IBR-22
Constraints = [Constraints, 0 <= Vn22 <= Vbase];
Constraints = [Constraints, 0 <= Vp22 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp22 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp22 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn22 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn22 <= Ibase];
% IBR-23
Constraints = [Constraints, 0 <= Vn23 <= Vbase];
Constraints = [Constraints, 0 <= Vp23 <= Vbase]; %Vp <= 1pu
Constraints = [Constraints, -Ibase <= Idp23 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqp23 <= Ibase];
Constraints = [Constraints, -Ibase <= Idn23 <= Ibase];
Constraints = [Constraints, -Ibase <= Iqn23 <= Ibase];
%% dq-axis components
% bus-1
Vdp1 = 0.25*Idp4 + 0.2502*Idp8 + 0.2502*Idp10 + 0.2501*Idp11 + 0.2502*Idp12 + 0.2494*Idp16 + 0.249*Idp21 + 0.2493*Idp22 + 0.249*Idp23 - 0.361*Iqp4 - 0.3567*Iqp8 - 0.3577*Iqp10 - 0.3575*Iqp11 - 0.3579*Iqp12 - 0.3584*Iqp16 - 0.3531*Iqp21 - 0.3567*Iqp22 - 0.3531*Iqp23 + 0.9881*Vgp;
Vqp1 = 0.361*Idp4 + 0.3567*Idp8 + 0.3577*Idp10 + 0.3575*Idp11 + 0.3579*Idp12 + 0.3584*Idp16 + 0.3531*Idp21 + 0.3567*Idp22 + 0.3531*Idp23 + 0.25*Iqp4 + 0.2502*Iqp8 + 0.2502*Iqp10 + 0.2501*Iqp11 + 0.2502*Iqp12 + 0.2494*Iqp16 + 0.249*Iqp21 + 0.2493*Iqp22 + 0.249*Iqp23 - 0.007633*Vgp;
Vdn1 = 0.25*Idn4 + 0.2502*Idn8 + 0.2502*Idn10 + 0.2501*Idn11 + 0.2502*Idn12 + 0.2494*Idn16 + 0.249*Idn21 + 0.2493*Idn22 + 0.249*Idn23 + 0.361*Iqn4 + 0.3567*Iqn8 + 0.3577*Iqn10 + 0.3575*Iqn11 + 0.3579*Iqn12 + 0.3584*Iqn16 + 0.3531*Iqn21 + 0.3567*Iqn22 + 0.3531*Iqn23 + 0.9881*Vgdn - 0.007633*Vgqn;
Vqn1 = 0.25*Iqn4 - 0.3567*Idn8 - 0.3577*Idn10 - 0.3575*Idn11 - 0.3579*Idn12 - 0.3584*Idn16 - 0.3531*Idn21 - 0.3567*Idn22 - 0.3531*Idn23 - 0.361*Idn4 + 0.2502*Iqn8 + 0.2502*Iqn10 + 0.2501*Iqn11 + 0.2502*Iqn12 + 0.2494*Iqn16 + 0.249*Iqn21 + 0.2493*Iqn22 + 0.249*Iqn23 + 0.007633*Vgdn + 0.9881*Vgqn;
% bus-2
Vdp2 = 0.5001*Idp4 + 0.5005*Idp8 + 0.5004*Idp10 + 0.5003*Idp11 + 0.5003*Idp12 + 0.4989*Idp16 + 0.498*Idp21 + 0.4986*Idp22 + 0.498*Idp23 - 0.7219*Iqp4 - 0.7135*Iqp8 - 0.7154*Iqp10 - 0.715*Iqp11 - 0.7159*Iqp12 - 0.7168*Iqp16 - 0.7062*Iqp21 - 0.7133*Iqp22 - 0.7062*Iqp23 + 0.9762*Vgp;
Vqp2 = 0.7219*Idp4 + 0.7135*Idp8 + 0.7154*Idp10 + 0.715*Idp11 + 0.7159*Idp12 + 0.7168*Idp16 + 0.7062*Idp21 + 0.7133*Idp22 + 0.7062*Idp23 + 0.5001*Iqp4 + 0.5005*Iqp8 + 0.5004*Iqp10 + 0.5003*Iqp11 + 0.5003*Iqp12 + 0.4989*Iqp16 + 0.498*Iqp21 + 0.4986*Iqp22 + 0.498*Iqp23 - 0.01527*Vgp;
Vdn2 = 0.5001*Idn4 + 0.5005*Idn8 + 0.5004*Idn10 + 0.5003*Idn11 + 0.5003*Idn12 + 0.4989*Idn16 + 0.498*Idn21 + 0.4986*Idn22 + 0.498*Idn23 + 0.7219*Iqn4 + 0.7135*Iqn8 + 0.7154*Iqn10 + 0.715*Iqn11 + 0.7159*Iqn12 + 0.7168*Iqn16 + 0.7062*Iqn21 + 0.7133*Iqn22 + 0.7062*Iqn23 + 0.9762*Vgdn - 0.01527*Vgqn;
Vqn2 = 0.5001*Iqn4 - 0.7135*Idn8 - 0.7154*Idn10 - 0.715*Idn11 - 0.7159*Idn12 - 0.7168*Idn16 - 0.7062*Idn21 - 0.7133*Idn22 - 0.7062*Idn23 - 0.7219*Idn4 + 0.5005*Iqn8 + 0.5004*Iqn10 + 0.5003*Iqn11 + 0.5003*Iqn12 + 0.4989*Iqn16 + 0.498*Iqn21 + 0.4986*Iqn22 + 0.498*Iqn23 + 0.01527*Vgdn + 0.9762*Vgqn;
% bus-3
Vdp3 = 0.7506*Idp4 + 0.7512*Idp8 + 0.751*Idp10 + 0.7509*Idp11 + 0.7509*Idp12 + 0.4991*Idp16 + 0.4981*Idp21 + 0.4988*Idp22 + 0.4982*Idp23 - 1.09*Iqp4 - 1.078*Iqp8 - 1.081*Iqp10 - 1.08*Iqp11 - 1.081*Iqp12 - 0.7116*Iqp16 - 0.7011*Iqp21 - 0.7082*Iqp22 - 0.7011*Iqp23 + 0.9715*Vgp;
Vqp3 = 1.09*Idp4 + 1.078*Idp8 + 1.081*Idp10 + 1.08*Idp11 + 1.081*Idp12 + 0.7116*Idp16 + 0.7011*Idp21 + 0.7082*Idp22 + 0.7011*Idp23 + 0.7506*Iqp4 + 0.7512*Iqp8 + 0.751*Iqp10 + 0.7509*Iqp11 + 0.7509*Iqp12 + 0.4991*Iqp16 + 0.4981*Iqp21 + 0.4988*Iqp22 + 0.4982*Iqp23 - 0.01863*Vgp;
Vdn3 = 0.7506*Idn4 + 0.7512*Idn8 + 0.751*Idn10 + 0.7509*Idn11 + 0.7509*Idn12 + 0.4991*Idn16 + 0.4981*Idn21 + 0.4988*Idn22 + 0.4982*Idn23 + 1.09*Iqn4 + 1.078*Iqn8 + 1.081*Iqn10 + 1.08*Iqn11 + 1.081*Iqn12 + 0.7116*Iqn16 + 0.7011*Iqn21 + 0.7082*Iqn22 + 0.7011*Iqn23 + 0.9715*Vgdn - 0.01863*Vgqn;
Vqn3 = 0.7506*Iqn4 - 1.078*Idn8 - 1.081*Idn10 - 1.08*Idn11 - 1.081*Idn12 - 0.7116*Idn16 - 0.7011*Idn21 - 0.7082*Idn22 - 0.7011*Idn23 - 1.09*Idn4 + 0.7512*Iqn8 + 0.751*Iqn10 + 0.7509*Iqn11 + 0.7509*Iqn12 + 0.4991*Iqn16 + 0.4981*Iqn21 + 0.4988*Iqn22 + 0.4982*Iqn23 + 0.01863*Vgdn + 0.9715*Vgqn;
% bus-4
Vdp4 = 1.001*Idp4 + 1.002*Idp8 + 1.002*Idp10 + 1.002*Idp11 + 1.002*Idp12 + 0.4992*Idp16 + 0.4983*Idp21 + 0.4989*Idp22 + 0.4983*Idp23 - 1.46*Iqp4 - 1.443*Iqp8 - 1.447*Iqp10 - 1.446*Iqp11 - 1.448*Iqp12 - 0.707*Iqp16 - 0.6965*Iqp21 - 0.7036*Iqp22 - 0.6965*Iqp23 + 0.9673*Vgp;
Vqp4 = 1.46*Idp4 + 1.443*Idp8 + 1.447*Idp10 + 1.446*Idp11 + 1.448*Idp12 + 0.707*Idp16 + 0.6965*Idp21 + 0.7036*Idp22 + 0.6965*Idp23 + 1.001*Iqp4 + 1.002*Iqp8 + 1.002*Iqp10 + 1.002*Iqp11 + 1.002*Iqp12 + 0.4992*Iqp16 + 0.4983*Iqp21 + 0.4989*Iqp22 + 0.4983*Iqp23 - 0.0217*Vgp;
Vdn4 = 1.001*Idn4 + 1.002*Idn8 + 1.002*Idn10 + 1.002*Idn11 + 1.002*Idn12 + 0.4992*Idn16 + 0.4983*Idn21 + 0.4989*Idn22 + 0.4983*Idn23 + 1.46*Iqn4 + 1.443*Iqn8 + 1.447*Iqn10 + 1.446*Iqn11 + 1.448*Iqn12 + 0.707*Iqn16 + 0.6965*Iqn21 + 0.7036*Iqn22 + 0.6965*Iqn23 + 0.9673*Vgdn - 0.0217*Vgqn;
Vqn4 = 1.001*Iqn4 - 1.443*Idn8 - 1.447*Idn10 - 1.446*Idn11 - 1.448*Idn12 - 0.707*Idn16 - 0.6965*Idn21 - 0.7036*Idn22 - 0.6965*Idn23 - 1.46*Idn4 + 1.002*Iqn8 + 1.002*Iqn10 + 1.002*Iqn11 + 1.002*Iqn12 + 0.4992*Iqn16 + 0.4983*Iqn21 + 0.4989*Iqn22 + 0.4983*Iqn23 + 0.0217*Vgdn + 0.9673*Vgqn;
% bus-5
Vdp5 = 1.001*Idp4 + 1.253*Idp8 + 1.252*Idp10 + 1.252*Idp11 + 1.252*Idp12 + 0.4994*Idp16 + 0.4984*Idp21 + 0.499*Idp22 + 0.4984*Idp23 - 1.451*Iqp4 - 1.809*Iqp8 - 1.814*Iqp10 - 1.812*Iqp11 - 1.815*Iqp12 - 0.7028*Iqp16 - 0.6924*Iqp21 - 0.6994*Iqp22 - 0.6924*Iqp23 + 0.9635*Vgp;
Vqp5 = 1.451*Idp4 + 1.809*Idp8 + 1.814*Idp10 + 1.812*Idp11 + 1.815*Idp12 + 0.7028*Idp16 + 0.6924*Idp21 + 0.6994*Idp22 + 0.6924*Idp23 + 1.001*Iqp4 + 1.253*Iqp8 + 1.252*Iqp10 + 1.252*Iqp11 + 1.252*Iqp12 + 0.4994*Iqp16 + 0.4984*Iqp21 + 0.499*Iqp22 + 0.4984*Iqp23 - 0.02444*Vgp;
Vdn5 = 1.001*Idn4 + 1.253*Idn8 + 1.252*Idn10 + 1.252*Idn11 + 1.252*Idn12 + 0.4994*Idn16 + 0.4984*Idn21 + 0.499*Idn22 + 0.4984*Idn23 + 1.451*Iqn4 + 1.809*Iqn8 + 1.814*Iqn10 + 1.812*Iqn11 + 1.815*Iqn12 + 0.7028*Iqn16 + 0.6924*Iqn21 + 0.6994*Iqn22 + 0.6924*Iqn23 + 0.9635*Vgdn - 0.02444*Vgqn;
Vqn5 = 1.001*Iqn4 - 1.809*Idn8 - 1.814*Idn10 - 1.812*Idn11 - 1.815*Idn12 - 0.7028*Idn16 - 0.6924*Idn21 - 0.6994*Idn22 - 0.6924*Idn23 - 1.451*Idn4 + 1.253*Iqn8 + 1.252*Iqn10 + 1.252*Iqn11 + 1.252*Iqn12 + 0.4994*Iqn16 + 0.4984*Iqn21 + 0.499*Iqn22 + 0.4984*Iqn23 + 0.02444*Vgdn + 0.9635*Vgqn;
% bus-6
Vdp6 = 1.002*Idp4 + 1.503*Idp8 + 1.253*Idp10 + 1.252*Idp11 + 1.252*Idp12 + 0.4995*Idp16 + 0.4985*Idp21 + 0.4992*Idp22 + 0.4985*Idp23 - 1.447*Iqp4 - 2.18*Iqp8 - 1.809*Iqp10 - 1.808*Iqp11 - 1.81*Iqp12 - 0.7009*Iqp16 - 0.6905*Iqp21 - 0.6975*Iqp22 - 0.6905*Iqp23 + 0.9618*Vgp;
Vqp6 = 1.447*Idp4 + 2.18*Idp8 + 1.809*Idp10 + 1.808*Idp11 + 1.81*Idp12 + 0.7009*Idp16 + 0.6905*Idp21 + 0.6975*Idp22 + 0.6905*Idp23 + 1.002*Iqp4 + 1.503*Iqp8 + 1.253*Iqp10 + 1.252*Iqp11 + 1.252*Iqp12 + 0.4995*Iqp16 + 0.4985*Iqp21 + 0.4992*Iqp22 + 0.4985*Iqp23 - 0.02574*Vgp;
Vdn6 = 1.002*Idn4 + 1.503*Idn8 + 1.253*Idn10 + 1.252*Idn11 + 1.252*Idn12 + 0.4995*Idn16 + 0.4985*Idn21 + 0.4992*Idn22 + 0.4985*Idn23 + 1.447*Iqn4 + 2.18*Iqn8 + 1.809*Iqn10 + 1.808*Iqn11 + 1.81*Iqn12 + 0.7009*Iqn16 + 0.6905*Iqn21 + 0.6975*Iqn22 + 0.6905*Iqn23 + 0.9618*Vgdn - 0.02574*Vgqn;
Vqn6 = 1.002*Iqn4 - 2.18*Idn8 - 1.809*Idn10 - 1.808*Idn11 - 1.81*Idn12 - 0.7009*Idn16 - 0.6905*Idn21 - 0.6975*Idn22 - 0.6905*Idn23 - 1.447*Idn4 + 1.503*Iqn8 + 1.253*Iqn10 + 1.252*Iqn11 + 1.252*Iqn12 + 0.4995*Iqn16 + 0.4985*Iqn21 + 0.4992*Iqn22 + 0.4985*Iqn23 + 0.02574*Vgdn + 0.9618*Vgqn;
% bus-7
Vdp7 = 1.002*Idp4 + 1.753*Idp8 + 1.253*Idp10 + 1.253*Idp11 + 1.253*Idp12 + 0.4995*Idp16 + 0.4985*Idp21 + 0.4992*Idp22 + 0.4986*Idp23 - 1.445*Iqp4 - 2.554*Iqp8 - 1.805*Iqp10 - 1.804*Iqp11 - 1.806*Iqp12 - 0.6995*Iqp16 - 0.6891*Iqp21 - 0.6961*Iqp22 - 0.6891*Iqp23 + 0.9606*Vgp;
Vqp7 = 1.445*Idp4 + 2.554*Idp8 + 1.805*Idp10 + 1.804*Idp11 + 1.806*Idp12 + 0.6995*Idp16 + 0.6891*Idp21 + 0.6961*Idp22 + 0.6891*Idp23 + 1.002*Iqp4 + 1.753*Iqp8 + 1.253*Iqp10 + 1.253*Iqp11 + 1.253*Iqp12 + 0.4995*Iqp16 + 0.4985*Iqp21 + 0.4992*Iqp22 + 0.4986*Iqp23 - 0.02664*Vgp;
Vdn7 = 1.002*Idn4 + 1.753*Idn8 + 1.253*Idn10 + 1.253*Idn11 + 1.253*Idn12 + 0.4995*Idn16 + 0.4985*Idn21 + 0.4992*Idn22 + 0.4986*Idn23 + 1.445*Iqn4 + 2.554*Iqn8 + 1.805*Iqn10 + 1.804*Iqn11 + 1.806*Iqn12 + 0.6995*Iqn16 + 0.6891*Iqn21 + 0.6961*Iqn22 + 0.6891*Iqn23 + 0.9606*Vgdn - 0.02664*Vgqn;
Vqn7 = 1.002*Iqn4 - 2.554*Idn8 - 1.805*Idn10 - 1.804*Idn11 - 1.806*Idn12 - 0.6995*Idn16 - 0.6891*Idn21 - 0.6961*Idn22 - 0.6891*Idn23 - 1.445*Idn4 + 1.753*Iqn8 + 1.253*Iqn10 + 1.253*Iqn11 + 1.253*Iqn12 + 0.4995*Iqn16 + 0.4985*Iqn21 + 0.4992*Iqn22 + 0.4986*Iqn23 + 0.02664*Vgdn + 0.9606*Vgqn;
% bus-8
Vdp8 = 1.002*Idp4 + 2.003*Idp8 + 1.253*Idp10 + 1.253*Idp11 + 1.253*Idp12 + 0.4995*Idp16 + 0.4985*Idp21 + 0.4992*Idp22 + 0.4985*Idp23 - 1.443*Iqp4 - 2.929*Iqp8 - 1.803*Iqp10 - 1.802*Iqp11 - 1.804*Iqp12 - 0.6986*Iqp16 - 0.6882*Iqp21 - 0.6952*Iqp22 - 0.6882*Iqp23 + 0.9597*Vgp;
Vqp8 = 1.443*Idp4 + 2.929*Idp8 + 1.803*Idp10 + 1.802*Idp11 + 1.804*Idp12 + 0.6986*Idp16 + 0.6882*Idp21 + 0.6952*Idp22 + 0.6882*Idp23 + 1.002*Iqp4 + 2.003*Iqp8 + 1.253*Iqp10 + 1.253*Iqp11 + 1.253*Iqp12 + 0.4995*Iqp16 + 0.4985*Iqp21 + 0.4992*Iqp22 + 0.4985*Iqp23 - 0.0272*Vgp;
Vdn8 = 1.002*Idn4 + 2.003*Idn8 + 1.253*Idn10 + 1.253*Idn11 + 1.253*Idn12 + 0.4995*Idn16 + 0.4985*Idn21 + 0.4992*Idn22 + 0.4985*Idn23 + 1.443*Iqn4 + 2.929*Iqn8 + 1.803*Iqn10 + 1.802*Iqn11 + 1.804*Iqn12 + 0.6986*Iqn16 + 0.6882*Iqn21 + 0.6952*Iqn22 + 0.6882*Iqn23 + 0.9597*Vgdn - 0.0272*Vgqn;
Vqn8 = 1.002*Iqn4 - 2.929*Idn8 - 1.803*Idn10 - 1.802*Idn11 - 1.804*Idn12 - 0.6986*Idn16 - 0.6882*Idn21 - 0.6952*Idn22 - 0.6882*Idn23 - 1.443*Idn4 + 2.003*Iqn8 + 1.253*Iqn10 + 1.253*Iqn11 + 1.253*Iqn12 + 0.4995*Iqn16 + 0.4985*Iqn21 + 0.4992*Iqn22 + 0.4985*Iqn23 + 0.0272*Vgdn + 0.9597*Vgqn;
% bus-9
Vdp9 = 1.002*Idp4 + 1.253*Idp8 + 1.502*Idp10 + 1.502*Idp11 + 1.502*Idp12 + 0.4994*Idp16 + 0.4984*Idp21 + 0.4991*Idp22 + 0.4984*Idp23 - 1.448*Iqp4 - 1.804*Iqp8 - 2.187*Iqp10 - 2.185*Iqp11 - 2.188*Iqp12 - 0.701*Iqp16 - 0.6906*Iqp21 - 0.6976*Iqp22 - 0.6906*Iqp23 + 0.9619*Vgp;
Vqp9 = 1.448*Idp4 + 1.804*Idp8 + 2.187*Idp10 + 2.185*Idp11 + 2.188*Idp12 + 0.701*Idp16 + 0.6906*Idp21 + 0.6976*Idp22 + 0.6906*Idp23 + 1.002*Iqp4 + 1.253*Iqp8 + 1.502*Iqp10 + 1.502*Iqp11 + 1.502*Iqp12 + 0.4994*Iqp16 + 0.4984*Iqp21 + 0.4991*Iqp22 + 0.4984*Iqp23 - 0.02558*Vgp;
Vdn9 = 1.002*Idn4 + 1.253*Idn8 + 1.502*Idn10 + 1.502*Idn11 + 1.502*Idn12 + 0.4994*Idn16 + 0.4984*Idn21 + 0.4991*Idn22 + 0.4984*Idn23 + 1.448*Iqn4 + 1.804*Iqn8 + 2.187*Iqn10 + 2.185*Iqn11 + 2.188*Iqn12 + 0.701*Iqn16 + 0.6906*Iqn21 + 0.6976*Iqn22 + 0.6906*Iqn23 + 0.9619*Vgdn - 0.02558*Vgqn;
Vqn9 = 1.002*Iqn4 - 1.804*Idn8 - 2.187*Idn10 - 2.185*Idn11 - 2.188*Idn12 - 0.701*Idn16 - 0.6906*Idn21 - 0.6976*Idn22 - 0.6906*Idn23 - 1.448*Idn4 + 1.253*Iqn8 + 1.502*Iqn10 + 1.502*Iqn11 + 1.502*Iqn12 + 0.4994*Iqn16 + 0.4984*Iqn21 + 0.4991*Iqn22 + 0.4984*Iqn23 + 0.02558*Vgdn + 0.9619*Vgqn;
% bus-10
Vdp10 = 1.002*Idp4 + 1.253*Idp8 + 1.753*Idp10 + 1.502*Idp11 + 1.502*Idp12 + 0.4994*Idp16 + 0.4984*Idp21 + 0.4991*Idp22 + 0.4985*Idp23 - 1.447*Iqp4 - 1.803*Iqp8 - 2.564*Iqp10 - 2.184*Iqp11 - 2.187*Iqp12 - 0.7006*Iqp16 - 0.6901*Iqp21 - 0.6972*Iqp22 - 0.6902*Iqp23 + 0.9615*Vgp;
Vqp10 = 1.447*Idp4 + 1.803*Idp8 + 2.564*Idp10 + 2.184*Idp11 + 2.187*Idp12 + 0.7006*Idp16 + 0.6901*Idp21 + 0.6972*Idp22 + 0.6902*Idp23 + 1.002*Iqp4 + 1.253*Iqp8 + 1.753*Iqp10 + 1.502*Iqp11 + 1.502*Iqp12 + 0.4994*Iqp16 + 0.4984*Iqp21 + 0.4991*Iqp22 + 0.4985*Iqp23 - 0.02589*Vgp;
Vdn10 = 1.002*Idn4 + 1.253*Idn8 + 1.753*Idn10 + 1.502*Idn11 + 1.502*Idn12 + 0.4994*Idn16 + 0.4984*Idn21 + 0.4991*Idn22 + 0.4985*Idn23 + 1.447*Iqn4 + 1.803*Iqn8 + 2.564*Iqn10 + 2.184*Iqn11 + 2.187*Iqn12 + 0.7006*Iqn16 + 0.6901*Iqn21 + 0.6972*Iqn22 + 0.6902*Iqn23 + 0.9615*Vgdn - 0.02589*Vgqn;
Vqn10 = 1.002*Iqn4 - 1.803*Idn8 - 2.564*Idn10 - 2.184*Idn11 - 2.187*Idn12 - 0.7006*Idn16 - 0.6901*Idn21 - 0.6972*Idn22 - 0.6902*Idn23 - 1.447*Idn4 + 1.253*Iqn8 + 1.753*Iqn10 + 1.502*Iqn11 + 1.502*Iqn12 + 0.4994*Iqn16 + 0.4984*Iqn21 + 0.4991*Iqn22 + 0.4985*Iqn23 + 0.02589*Vgdn + 0.9615*Vgqn;
% bus-11
Vdp11 = 1.002*Idp4 + 1.253*Idp8 + 1.502*Idp10 + 1.752*Idp11 + 1.502*Idp12 + 0.4994*Idp16 + 0.4983*Idp21 + 0.499*Idp22 + 0.4984*Idp23 - 1.446*Iqp4 - 1.802*Iqp8 - 2.184*Iqp10 - 2.561*Iqp11 - 2.185*Iqp12 - 0.7001*Iqp16 - 0.6897*Iqp21 - 0.6967*Iqp22 - 0.6897*Iqp23 + 0.961*Vgp;
Vqp11 = 1.446*Idp4 + 1.802*Idp8 + 2.184*Idp10 + 2.561*Idp11 + 2.185*Idp12 + 0.7001*Idp16 + 0.6897*Idp21 + 0.6967*Idp22 + 0.6897*Idp23 + 1.002*Iqp4 + 1.253*Iqp8 + 1.502*Iqp10 + 1.752*Iqp11 + 1.502*Iqp12 + 0.4994*Iqp16 + 0.4983*Iqp21 + 0.499*Iqp22 + 0.4984*Iqp23 - 0.0261*Vgp;
Vdn11 = 1.002*Idn4 + 1.253*Idn8 + 1.502*Idn10 + 1.752*Idn11 + 1.502*Idn12 + 0.4994*Idn16 + 0.4983*Idn21 + 0.499*Idn22 + 0.4984*Idn23 + 1.446*Iqn4 + 1.802*Iqn8 + 2.184*Iqn10 + 2.561*Iqn11 + 2.185*Iqn12 + 0.7001*Iqn16 + 0.6897*Iqn21 + 0.6967*Iqn22 + 0.6897*Iqn23 + 0.961*Vgdn - 0.0261*Vgqn;
Vqn11 = 1.002*Iqn4 - 1.802*Idn8 - 2.184*Idn10 - 2.561*Idn11 - 2.185*Idn12 - 0.7001*Idn16 - 0.6897*Idn21 - 0.6967*Idn22 - 0.6897*Idn23 - 1.446*Idn4 + 1.253*Iqn8 + 1.502*Iqn10 + 1.752*Iqn11 + 1.502*Iqn12 + 0.4994*Iqn16 + 0.4983*Iqn21 + 0.499*Iqn22 + 0.4984*Iqn23 + 0.0261*Vgdn + 0.961*Vgqn;
% bus-12
Vdp12 = 1.002*Idp4 + 1.253*Idp8 + 1.502*Idp10 + 1.502*Idp11 + 1.752*Idp12 + 0.4994*Idp16 + 0.4984*Idp21 + 0.4991*Idp22 + 0.4984*Idp23 - 1.448*Iqp4 - 1.804*Iqp8 - 2.187*Iqp10 - 2.185*Iqp11 - 2.567*Iqp12 - 0.701*Iqp16 - 0.6906*Iqp21 - 0.6976*Iqp22 - 0.6906*Iqp23 + 0.9619*Vgp;
Vqp12 = 1.448*Idp4 + 1.804*Idp8 + 2.187*Idp10 + 2.185*Idp11 + 2.567*Idp12 + 0.701*Idp16 + 0.6906*Idp21 + 0.6976*Idp22 + 0.6906*Idp23 + 1.002*Iqp4 + 1.253*Iqp8 + 1.502*Iqp10 + 1.502*Iqp11 + 1.752*Iqp12 + 0.4994*Iqp16 + 0.4984*Iqp21 + 0.4991*Iqp22 + 0.4984*Iqp23 - 0.02558*Vgp;
Vdn12 = 1.002*Idn4 + 1.253*Idn8 + 1.502*Idn10 + 1.502*Idn11 + 1.752*Idn12 + 0.4994*Idn16 + 0.4984*Idn21 + 0.4991*Idn22 + 0.4984*Idn23 + 1.448*Iqn4 + 1.804*Iqn8 + 2.187*Iqn10 + 2.185*Iqn11 + 2.567*Iqn12 + 0.701*Iqn16 + 0.6906*Iqn21 + 0.6976*Iqn22 + 0.6906*Iqn23 + 0.9619*Vgdn - 0.02558*Vgqn;
Vqn12 = 1.002*Iqn4 - 1.804*Idn8 - 2.187*Idn10 - 2.185*Idn11 - 2.567*Idn12 - 0.701*Idn16 - 0.6906*Idn21 - 0.6976*Idn22 - 0.6906*Idn23 - 1.448*Idn4 + 1.253*Iqn8 + 1.502*Iqn10 + 1.502*Iqn11 + 1.752*Iqn12 + 0.4994*Iqn16 + 0.4984*Iqn21 + 0.4991*Iqn22 + 0.4984*Iqn23 + 0.02558*Vgdn + 0.9619*Vgqn;
% bus-13
Vdp13 = 0.4997*Idp4 + 0.5*Idp8 + 0.4999*Idp10 + 0.4998*Idp11 + 0.4999*Idp12 + 0.7482*Idp16 + 0.7468*Idp21 + 0.7477*Idp22 + 0.7469*Idp23 - 0.7149*Iqp4 - 0.7065*Iqp8 - 0.7085*Iqp10 - 0.708*Iqp11 - 0.7089*Iqp12 - 1.081*Iqp16 - 1.065*Iqp21 - 1.076*Iqp22 - 1.065*Iqp23 + 0.9694*Vgp;
Vqp13 = 0.7149*Idp4 + 0.7065*Idp8 + 0.7085*Idp10 + 0.708*Idp11 + 0.7089*Idp12 + 1.081*Idp16 + 1.065*Idp21 + 1.076*Idp22 + 1.065*Idp23 + 0.4997*Iqp4 + 0.5*Iqp8 + 0.4999*Iqp10 + 0.4998*Iqp11 + 0.4999*Iqp12 + 0.7482*Iqp16 + 0.7468*Iqp21 + 0.7477*Iqp22 + 0.7469*Iqp23 - 0.0192*Vgp;
Vdn13 = 0.4997*Idn4 + 0.5*Idn8 + 0.4999*Idn10 + 0.4998*Idn11 + 0.4999*Idn12 + 0.7482*Idn16 + 0.7468*Idn21 + 0.7477*Idn22 + 0.7469*Idn23 + 0.7149*Iqn4 + 0.7065*Iqn8 + 0.7085*Iqn10 + 0.708*Iqn11 + 0.7089*Iqn12 + 1.081*Iqn16 + 1.065*Iqn21 + 1.076*Iqn22 + 1.065*Iqn23 + 0.9694*Vgdn - 0.0192*Vgqn;
Vqn13 = 0.4997*Iqn4 - 0.7065*Idn8 - 0.7085*Idn10 - 0.708*Idn11 - 0.7089*Idn12 - 1.081*Idn16 - 1.065*Idn21 - 1.076*Idn22 - 1.065*Idn23 - 0.7149*Idn4 + 0.5*Iqn8 + 0.4999*Iqn10 + 0.4998*Iqn11 + 0.4999*Iqn12 + 0.7482*Iqn16 + 0.7468*Iqn21 + 0.7477*Iqn22 + 0.7469*Iqn23 + 0.0192*Vgdn + 0.9694*Vgqn;
% bus-14
Vdp14 = 0.4993*Idp4 + 0.4996*Idp8 + 0.4995*Idp10 + 0.4994*Idp11 + 0.4994*Idp12 + 0.9975*Idp16 + 0.9958*Idp21 + 0.9969*Idp22 + 0.9958*Idp23 - 0.7084*Iqp4 - 0.7*Iqp8 - 0.702*Iqp10 - 0.7016*Iqp11 - 0.7024*Iqp12 - 1.446*Iqp16 - 1.424*Iqp21 - 1.439*Iqp22 - 1.424*Iqp23 + 0.9631*Vgp;
Vqp14 = 0.7084*Idp4 + 0.7*Idp8 + 0.702*Idp10 + 0.7016*Idp11 + 0.7024*Idp12 + 1.446*Idp16 + 1.424*Idp21 + 1.439*Idp22 + 1.424*Idp23 + 0.4993*Iqp4 + 0.4996*Iqp8 + 0.4995*Iqp10 + 0.4994*Iqp11 + 0.4994*Iqp12 + 0.9975*Iqp16 + 0.9958*Iqp21 + 0.9969*Iqp22 + 0.9958*Iqp23 - 0.02287*Vgp;
Vdn14 = 0.4993*Idn4 + 0.4996*Idn8 + 0.4995*Idn10 + 0.4994*Idn11 + 0.4994*Idn12 + 0.9975*Idn16 + 0.9958*Idn21 + 0.9969*Idn22 + 0.9958*Idn23 + 0.7084*Iqn4 + 0.7*Iqn8 + 0.702*Iqn10 + 0.7016*Iqn11 + 0.7024*Iqn12 + 1.446*Iqn16 + 1.424*Iqn21 + 1.439*Iqn22 + 1.424*Iqn23 + 0.9631*Vgdn - 0.02287*Vgqn;
Vqn14 = 0.4993*Iqn4 - 0.7*Idn8 - 0.702*Idn10 - 0.7016*Idn11 - 0.7024*Idn12 - 1.446*Idn16 - 1.424*Idn21 - 1.439*Idn22 - 1.424*Idn23 - 0.7084*Idn4 + 0.4996*Iqn8 + 0.4995*Iqn10 + 0.4994*Iqn11 + 0.4994*Iqn12 + 0.9975*Iqn16 + 0.9958*Iqn21 + 0.9969*Iqn22 + 0.9958*Iqn23 + 0.02287*Vgdn + 0.9631*Vgqn;
% bus-15
Vdp15 = 0.4993*Idp4 + 0.4996*Idp8 + 0.4995*Idp10 + 0.4994*Idp11 + 0.4994*Idp12 + 1.248*Idp16 + 0.9958*Idp21 + 0.9969*Idp22 + 0.9958*Idp23 - 0.7074*Iqp4 - 0.6991*Iqp8 - 0.701*Iqp10 - 0.7006*Iqp11 - 0.7015*Iqp12 - 1.822*Iqp16 - 1.422*Iqp21 - 1.437*Iqp22 - 1.422*Iqp23 + 0.9622*Vgp;
Vqp15 = 0.7074*Idp4 + 0.6991*Idp8 + 0.701*Idp10 + 0.7006*Idp11 + 0.7015*Idp12 + 1.822*Idp16 + 1.422*Idp21 + 1.437*Idp22 + 1.422*Idp23 + 0.4993*Iqp4 + 0.4996*Iqp8 + 0.4995*Iqp10 + 0.4994*Iqp11 + 0.4994*Iqp12 + 1.248*Iqp16 + 0.9958*Iqp21 + 0.9969*Iqp22 + 0.9958*Iqp23 - 0.02347*Vgp;
Vdn15 = 0.4993*Idn4 + 0.4996*Idn8 + 0.4995*Idn10 + 0.4994*Idn11 + 0.4994*Idn12 + 1.248*Idn16 + 0.9958*Idn21 + 0.9969*Idn22 + 0.9958*Idn23 + 0.7074*Iqn4 + 0.6991*Iqn8 + 0.701*Iqn10 + 0.7006*Iqn11 + 0.7015*Iqn12 + 1.822*Iqn16 + 1.422*Iqn21 + 1.437*Iqn22 + 1.422*Iqn23 + 0.9622*Vgdn - 0.02347*Vgqn;
Vqn15 = 0.4993*Iqn4 - 0.6991*Idn8 - 0.701*Idn10 - 0.7006*Idn11 - 0.7015*Idn12 - 1.822*Idn16 - 1.422*Idn21 - 1.437*Idn22 - 1.422*Idn23 - 0.7074*Idn4 + 0.4996*Iqn8 + 0.4995*Iqn10 + 0.4994*Iqn11 + 0.4994*Iqn12 + 1.248*Iqn16 + 0.9958*Iqn21 + 0.9969*Iqn22 + 0.9958*Iqn23 + 0.02347*Vgdn + 0.9622*Vgqn;
% bus-16
Vdp16 = 0.4992*Idp4 + 0.4995*Idp8 + 0.4994*Idp10 + 0.4994*Idp11 + 0.4994*Idp12 + 1.497*Idp16 + 0.9957*Idp21 + 0.9969*Idp22 + 0.9958*Idp23 - 0.707*Iqp4 - 0.6986*Iqp8 - 0.7006*Iqp10 - 0.7001*Iqp11 - 0.701*Iqp12 - 2.199*Iqp16 - 1.421*Iqp21 - 1.436*Iqp22 - 1.421*Iqp23 + 0.9618*Vgp;
Vqp16 = 0.707*Idp4 + 0.6986*Idp8 + 0.7006*Idp10 + 0.7001*Idp11 + 0.701*Idp12 + 2.199*Idp16 + 1.421*Idp21 + 1.436*Idp22 + 1.421*Idp23 + 0.4992*Iqp4 + 0.4995*Iqp8 + 0.4994*Iqp10 + 0.4994*Iqp11 + 0.4994*Iqp12 + 1.497*Iqp16 + 0.9957*Iqp21 + 0.9969*Iqp22 + 0.9958*Iqp23 - 0.02374*Vgp;
Vdn16 = 0.4992*Idn4 + 0.4995*Idn8 + 0.4994*Idn10 + 0.4994*Idn11 + 0.4994*Idn12 + 1.497*Idn16 + 0.9957*Idn21 + 0.9969*Idn22 + 0.9958*Idn23 + 0.707*Iqn4 + 0.6986*Iqn8 + 0.7006*Iqn10 + 0.7001*Iqn11 + 0.701*Iqn12 + 2.199*Iqn16 + 1.421*Iqn21 + 1.436*Iqn22 + 1.421*Iqn23 + 0.9618*Vgdn - 0.02374*Vgqn;
Vqn16 = 0.4992*Iqn4 - 0.6986*Idn8 - 0.7006*Idn10 - 0.7001*Idn11 - 0.701*Idn12 - 2.199*Idn16 - 1.421*Idn21 - 1.436*Idn22 - 1.421*Idn23 - 0.707*Idn4 + 0.4995*Iqn8 + 0.4994*Iqn10 + 0.4994*Iqn11 + 0.4994*Iqn12 + 1.497*Iqn16 + 0.9957*Iqn21 + 0.9969*Iqn22 + 0.9958*Iqn23 + 0.02374*Vgdn + 0.9618*Vgqn;
% bus-17
Vdp17 = 0.4989*Idp4 + 0.4992*Idp8 + 0.4991*Idp10 + 0.499*Idp11 + 0.4991*Idp12 + 0.9969*Idp16 + 1.245*Idp21 + 1.246*Idp22 + 1.245*Idp23 - 0.7041*Iqp4 - 0.6957*Iqp8 - 0.6977*Iqp10 - 0.6972*Iqp11 - 0.6981*Iqp12 - 1.437*Iqp16 - 1.788*Iqp21 - 1.806*Iqp22 - 1.788*Iqp23 + 0.9589*Vgp;
Vqp17 = 0.7041*Idp4 + 0.6957*Idp8 + 0.6977*Idp10 + 0.6972*Idp11 + 0.6981*Idp12 + 1.437*Idp16 + 1.788*Idp21 + 1.806*Idp22 + 1.788*Idp23 + 0.4989*Iqp4 + 0.4992*Iqp8 + 0.4991*Iqp10 + 0.499*Iqp11 + 0.4991*Iqp12 + 0.9969*Iqp16 + 1.245*Iqp21 + 1.246*Iqp22 + 1.245*Iqp23 - 0.02525*Vgp;
Vdn17 = 0.4989*Idn4 + 0.4992*Idn8 + 0.4991*Idn10 + 0.499*Idn11 + 0.4991*Idn12 + 0.9969*Idn16 + 1.245*Idn21 + 1.246*Idn22 + 1.245*Idn23 + 0.7041*Iqn4 + 0.6957*Iqn8 + 0.6977*Iqn10 + 0.6972*Iqn11 + 0.6981*Iqn12 + 1.437*Iqn16 + 1.788*Iqn21 + 1.806*Iqn22 + 1.788*Iqn23 + 0.9589*Vgdn - 0.02525*Vgqn;
Vqn17 = 0.4989*Iqn4 - 0.6957*Idn8 - 0.6977*Idn10 - 0.6972*Idn11 - 0.6981*Idn12 - 1.437*Idn16 - 1.788*Idn21 - 1.806*Idn22 - 1.788*Idn23 - 0.7041*Idn4 + 0.4992*Iqn8 + 0.4991*Iqn10 + 0.499*Iqn11 + 0.4991*Iqn12 + 0.9969*Iqn16 + 1.245*Iqn21 + 1.246*Iqn22 + 1.245*Iqn23 + 0.02525*Vgdn + 0.9589*Vgqn;
% bus-18
Vdp18 = 0.4987*Idp4 + 0.4989*Idp8 + 0.4988*Idp10 + 0.4988*Idp11 + 0.4988*Idp12 + 0.9964*Idp16 + 1.494*Idp21 + 1.246*Idp22 + 1.494*Idp23 - 0.7008*Iqp4 - 0.6924*Iqp8 - 0.6944*Iqp10 - 0.6939*Iqp11 - 0.6948*Iqp12 - 1.43*Iqp16 - 2.155*Iqp21 - 1.798*Iqp22 - 2.155*Iqp23 + 0.9557*Vgp;
Vqp18 = 0.7008*Idp4 + 0.6924*Idp8 + 0.6944*Idp10 + 0.6939*Idp11 + 0.6948*Idp12 + 1.43*Idp16 + 2.155*Idp21 + 1.798*Idp22 + 2.155*Idp23 + 0.4987*Iqp4 + 0.4989*Iqp8 + 0.4988*Iqp10 + 0.4988*Iqp11 + 0.4988*Iqp12 + 0.9964*Iqp16 + 1.494*Iqp21 + 1.246*Iqp22 + 1.494*Iqp23 - 0.02705*Vgp;
Vdn18 = 0.4987*Idn4 + 0.4989*Idn8 + 0.4988*Idn10 + 0.4988*Idn11 + 0.4988*Idn12 + 0.9964*Idn16 + 1.494*Idn21 + 1.246*Idn22 + 1.494*Idn23 + 0.7008*Iqn4 + 0.6924*Iqn8 + 0.6944*Iqn10 + 0.6939*Iqn11 + 0.6948*Iqn12 + 1.43*Iqn16 + 2.155*Iqn21 + 1.798*Iqn22 + 2.155*Iqn23 + 0.9557*Vgdn - 0.02705*Vgqn;
Vqn18 = 0.4987*Iqn4 - 0.6924*Idn8 - 0.6944*Idn10 - 0.6939*Idn11 - 0.6948*Idn12 - 1.43*Idn16 - 2.155*Idn21 - 1.798*Idn22 - 2.155*Idn23 - 0.7008*Idn4 + 0.4989*Iqn8 + 0.4988*Iqn10 + 0.4988*Iqn11 + 0.4988*Iqn12 + 0.9964*Iqn16 + 1.494*Iqn21 + 1.246*Iqn22 + 1.494*Iqn23 + 0.02705*Vgdn + 0.9557*Vgqn;
% bus-19
Vdp19 = 0.4984*Idp4 + 0.4987*Idp8 + 0.4986*Idp10 + 0.4985*Idp11 + 0.4985*Idp12 + 0.996*Idp16 + 1.743*Idp21 + 1.245*Idp22 + 1.743*Idp23 - 0.6979*Iqp4 - 0.6896*Iqp8 - 0.6916*Iqp10 - 0.6911*Iqp11 - 0.692*Iqp12 - 1.424*Iqp16 - 2.522*Iqp21 - 1.791*Iqp22 - 2.522*Iqp23 + 0.9529*Vgp;
Vqp19 = 0.6979*Idp4 + 0.6896*Idp8 + 0.6916*Idp10 + 0.6911*Idp11 + 0.692*Idp12 + 1.424*Idp16 + 2.522*Idp21 + 1.791*Idp22 + 2.522*Idp23 + 0.4984*Iqp4 + 0.4987*Iqp8 + 0.4986*Iqp10 + 0.4985*Iqp11 + 0.4985*Iqp12 + 0.996*Iqp16 + 1.743*Iqp21 + 1.245*Iqp22 + 1.743*Iqp23 - 0.02859*Vgp;
Vdn19 = 0.4984*Idn4 + 0.4987*Idn8 + 0.4986*Idn10 + 0.4985*Idn11 + 0.4985*Idn12 + 0.996*Idn16 + 1.743*Idn21 + 1.245*Idn22 + 1.743*Idn23 + 0.6979*Iqn4 + 0.6896*Iqn8 + 0.6916*Iqn10 + 0.6911*Iqn11 + 0.692*Iqn12 + 1.424*Iqn16 + 2.522*Iqn21 + 1.791*Iqn22 + 2.522*Iqn23 + 0.9529*Vgdn - 0.02859*Vgqn;
Vqn19 = 0.4984*Iqn4 - 0.6896*Idn8 - 0.6916*Idn10 - 0.6911*Idn11 - 0.692*Idn12 - 1.424*Idn16 - 2.522*Idn21 - 1.791*Idn22 - 2.522*Idn23 - 0.6979*Idn4 + 0.4987*Iqn8 + 0.4986*Iqn10 + 0.4985*Iqn11 + 0.4985*Iqn12 + 0.996*Iqn16 + 1.743*Iqn21 + 1.245*Iqn22 + 1.743*Iqn23 + 0.02859*Vgdn + 0.9529*Vgqn;
% bus-20
Vdp20 = 0.4983*Idp4 + 0.4986*Idp8 + 0.4985*Idp10 + 0.4984*Idp11 + 0.4985*Idp12 + 0.9958*Idp16 + 1.993*Idp21 + 1.245*Idp22 + 1.743*Idp23 - 0.697*Iqp4 - 0.6887*Iqp8 - 0.6906*Iqp10 - 0.6902*Iqp11 - 0.6911*Iqp12 - 1.422*Iqp16 - 2.897*Iqp21 - 1.788*Iqp22 - 2.519*Iqp23 + 0.952*Vgp;
Vqp20 = 0.697*Idp4 + 0.6887*Idp8 + 0.6906*Idp10 + 0.6902*Idp11 + 0.6911*Idp12 + 1.422*Idp16 + 2.897*Idp21 + 1.788*Idp22 + 2.519*Idp23 + 0.4983*Iqp4 + 0.4986*Iqp8 + 0.4985*Iqp10 + 0.4984*Iqp11 + 0.4985*Iqp12 + 0.9958*Iqp16 + 1.993*Iqp21 + 1.245*Iqp22 + 1.743*Iqp23 - 0.02909*Vgp;
Vdn20 = 0.4983*Idn4 + 0.4986*Idn8 + 0.4985*Idn10 + 0.4984*Idn11 + 0.4985*Idn12 + 0.9958*Idn16 + 1.993*Idn21 + 1.245*Idn22 + 1.743*Idn23 + 0.697*Iqn4 + 0.6887*Iqn8 + 0.6906*Iqn10 + 0.6902*Iqn11 + 0.6911*Iqn12 + 1.422*Iqn16 + 2.897*Iqn21 + 1.788*Iqn22 + 2.519*Iqn23 + 0.952*Vgdn - 0.02909*Vgqn;
Vqn20 = 0.4983*Iqn4 - 0.6887*Idn8 - 0.6906*Idn10 - 0.6902*Idn11 - 0.6911*Idn12 - 1.422*Idn16 - 2.897*Idn21 - 1.788*Idn22 - 2.519*Idn23 - 0.697*Idn4 + 0.4986*Iqn8 + 0.4985*Iqn10 + 0.4984*Iqn11 + 0.4985*Iqn12 + 0.9958*Iqn16 + 1.993*Iqn21 + 1.245*Iqn22 + 1.743*Iqn23 + 0.02909*Vgdn + 0.952*Vgqn;
% bus-21
Vdp21 = 0.4983*Idp4 + 0.4985*Idp8 + 0.4984*Idp10 + 0.4983*Idp11 + 0.4984*Idp12 + 0.9957*Idp16 + 2.243*Idp21 + 1.245*Idp22 + 1.743*Idp23 - 0.6965*Iqp4 - 0.6882*Iqp8 - 0.6901*Iqp10 - 0.6897*Iqp11 - 0.6906*Iqp12 - 1.421*Iqp16 - 3.274*Iqp21 - 1.787*Iqp22 - 2.517*Iqp23 + 0.9515*Vgp;
Vqp21 = 0.6965*Idp4 + 0.6882*Idp8 + 0.6901*Idp10 + 0.6897*Idp11 + 0.6906*Idp12 + 1.421*Idp16 + 3.274*Idp21 + 1.787*Idp22 + 2.517*Idp23 + 0.4983*Iqp4 + 0.4985*Iqp8 + 0.4984*Iqp10 + 0.4983*Iqp11 + 0.4984*Iqp12 + 0.9957*Iqp16 + 2.243*Iqp21 + 1.245*Iqp22 + 1.743*Iqp23 - 0.02933*Vgp;
Vdn21 = 0.4983*Idn4 + 0.4985*Idn8 + 0.4984*Idn10 + 0.4983*Idn11 + 0.4984*Idn12 + 0.9957*Idn16 + 2.243*Idn21 + 1.245*Idn22 + 1.743*Idn23 + 0.6965*Iqn4 + 0.6882*Iqn8 + 0.6901*Iqn10 + 0.6897*Iqn11 + 0.6906*Iqn12 + 1.421*Iqn16 + 3.274*Iqn21 + 1.787*Iqn22 + 2.517*Iqn23 + 0.9515*Vgdn - 0.02933*Vgqn;
Vqn21 = 0.4983*Iqn4 - 0.6882*Idn8 - 0.6901*Idn10 - 0.6897*Idn11 - 0.6906*Idn12 - 1.421*Idn16 - 3.274*Idn21 - 1.787*Idn22 - 2.517*Idn23 - 0.6965*Idn4 + 0.4985*Iqn8 + 0.4984*Iqn10 + 0.4983*Iqn11 + 0.4984*Iqn12 + 0.9957*Iqn16 + 2.243*Iqn21 + 1.245*Iqn22 + 1.743*Iqn23 + 0.02933*Vgdn + 0.9515*Vgqn;
% bus-22
Vdp22 = 0.4989*Idp4 + 0.4992*Idp8 + 0.4991*Idp10 + 0.499*Idp11 + 0.4991*Idp12 + 0.9969*Idp16 + 1.245*Idp21 + 1.496*Idp22 + 1.245*Idp23 - 0.7036*Iqp4 - 0.6952*Iqp8 - 0.6972*Iqp10 - 0.6967*Iqp11 - 0.6976*Iqp12 - 1.436*Iqp16 - 1.787*Iqp21 - 2.183*Iqp22 - 1.787*Iqp23 + 0.9585*Vgp;
Vqp22 = 0.7036*Idp4 + 0.6952*Idp8 + 0.6972*Idp10 + 0.6967*Idp11 + 0.6976*Idp12 + 1.436*Idp16 + 1.787*Idp21 + 2.183*Idp22 + 1.787*Idp23 + 0.4989*Iqp4 + 0.4992*Iqp8 + 0.4991*Iqp10 + 0.499*Iqp11 + 0.4991*Iqp12 + 0.9969*Iqp16 + 1.245*Iqp21 + 1.496*Iqp22 + 1.245*Iqp23 - 0.02555*Vgp;
Vdn22 = 0.4989*Idn4 + 0.4992*Idn8 + 0.4991*Idn10 + 0.499*Idn11 + 0.4991*Idn12 + 0.9969*Idn16 + 1.245*Idn21 + 1.496*Idn22 + 1.245*Idn23 + 0.7036*Iqn4 + 0.6952*Iqn8 + 0.6972*Iqn10 + 0.6967*Iqn11 + 0.6976*Iqn12 + 1.436*Iqn16 + 1.787*Iqn21 + 2.183*Iqn22 + 1.787*Iqn23 + 0.9585*Vgdn - 0.02555*Vgqn;
Vqn22 = 0.4989*Iqn4 - 0.6952*Idn8 - 0.6972*Idn10 - 0.6967*Idn11 - 0.6976*Idn12 - 1.436*Idn16 - 1.787*Idn21 - 2.183*Idn22 - 1.787*Idn23 - 0.7036*Idn4 + 0.4992*Iqn8 + 0.4991*Iqn10 + 0.499*Iqn11 + 0.4991*Iqn12 + 0.9969*Iqn16 + 1.245*Iqn21 + 1.496*Iqn22 + 1.245*Iqn23 + 0.02555*Vgdn + 0.9585*Vgqn;
% bus-23
Vdp23 = 0.4983*Idp4 + 0.4985*Idp8 + 0.4985*Idp10 + 0.4984*Idp11 + 0.4984*Idp12 + 0.9958*Idp16 + 1.743*Idp21 + 1.245*Idp22 + 1.993*Idp23 - 0.6965*Iqp4 - 0.6882*Iqp8 - 0.6902*Iqp10 - 0.6897*Iqp11 - 0.6906*Iqp12 - 1.421*Iqp16 - 2.517*Iqp21 - 1.787*Iqp22 - 2.895*Iqp23 + 0.9515*Vgp;
Vqp23 = 0.6965*Idp4 + 0.6882*Idp8 + 0.6902*Idp10 + 0.6897*Idp11 + 0.6906*Idp12 + 1.421*Idp16 + 2.517*Idp21 + 1.787*Idp22 + 2.895*Idp23 + 0.4983*Iqp4 + 0.4985*Iqp8 + 0.4985*Iqp10 + 0.4984*Iqp11 + 0.4984*Iqp12 + 0.9958*Iqp16 + 1.743*Iqp21 + 1.245*Iqp22 + 1.993*Iqp23 - 0.02935*Vgp;
Vdn23 = 0.4983*Idn4 + 0.4985*Idn8 + 0.4985*Idn10 + 0.4984*Idn11 + 0.4984*Idn12 + 0.9958*Idn16 + 1.743*Idn21 + 1.245*Idn22 + 1.993*Idn23 + 0.6965*Iqn4 + 0.6882*Iqn8 + 0.6902*Iqn10 + 0.6897*Iqn11 + 0.6906*Iqn12 + 1.421*Iqn16 + 2.517*Iqn21 + 1.787*Iqn22 + 2.895*Iqn23 + 0.9515*Vgdn - 0.02935*Vgqn;
Vqn23 = 0.4983*Iqn4 - 0.6882*Idn8 - 0.6902*Idn10 - 0.6897*Idn11 - 0.6906*Idn12 - 1.421*Idn16 - 2.517*Idn21 - 1.787*Idn22 - 2.895*Idn23 - 0.6965*Idn4 + 0.4985*Iqn8 + 0.4985*Iqn10 + 0.4984*Iqn11 + 0.4984*Iqn12 + 0.9958*Iqn16 + 1.743*Iqn21 + 1.245*Iqn22 + 1.993*Iqn23 + 0.02935*Vgdn + 0.9515*Vgqn;



% IBR-bus
buses = [4, 8, 10, 11, 12, 16, 21, 22, 23];
% Add constraints in a loop
for i = buses
    % Use eval to dynamically retrieve predefined sdpvar variables
    Vdn_var = eval(['Vdn', num2str(i)]);
    Vqn_var = eval(['Vqn', num2str(i)]);
    Vn_var  = eval(['Vn', num2str(i)]);
    
    % Add negative-sequence voltage magnitude constraints
    Constraints = [Constraints, Vdn_var^2 + Vqn_var^2 <= Vn_var^2]; % eq (6b)
   
end

% Add constraints in a loop
for i = buses
    % Use eval to dynamically retrieve predefined sdpvar variables
    Vdp_var = eval(['Vdp', num2str(i)]);
    Vqp_var = eval(['Vqp', num2str(i)]);
    Vp_var  = eval(['Vp', num2str(i)]);
    
    % Add positive-sequence voltage magnitude constraints
    Constraints = [Constraints, Vdp_var^2 + Vqp_var^2 <= Vp_var^2];% eq (6a)
   
end


%% eq (15)
% bus-1
Constraints = [Constraints, sum(bin1) <= 1];
for k = 1:num
    proj = Vdp1 * cos(Theta_k(k)) + Vqp1 * sin(Theta_k(k));
    Constraints = [Constraints, Vp1 <= proj / cos(pi/num) + M * (1 - bin(k))];
end
% bus-2
Constraints = [Constraints, sum(bin2) <= 1];
for k = 1:num
    proj = Vdp2 * cos(Theta_k(k)) + Vqp2 * sin(Theta_k(k));
    Constraints = [Constraints, Vp2 <= proj / cos(pi/num) + M * (1 - bin(k))];
end
% bus-3
Constraints = [Constraints, sum(bin3) <= 1];
for k = 1:num
    proj = Vdp3 * cos(Theta_k(k)) + Vqp3 * sin(Theta_k(k));
    Constraints = [Constraints, Vp3 <= proj / cos(pi/num) + M * (1 - bin(k))];
end
% IBR-4
Constraints = [Constraints, sum(bin4) <= 1];
for k = 1:num
    proj = Vdp4 * cos(Theta_k(k)) + Vqp4 * sin(Theta_k(k));
    Constraints = [Constraints, Vp4 <= proj / cos(pi/num) + M * (1 - bin(k))];
end

% IBR-8
Constraints = [Constraints, sum(bin8) <= 1];
for k = 1:num
    proj = Vdp8 * cos(Theta_k(k)) + Vqp8 * sin(Theta_k(k));
    Constraints = [Constraints, Vp8 <= proj / cos(pi/num) + M * (1 - bin8(k))];
end

% IBR-10
Constraints = [Constraints, sum(bin10) <= 1];
for k = 1:num
    proj = Vdp10 * cos(Theta_k(k)) + Vqp10 * sin(Theta_k(k));
    Constraints = [Constraints, Vp10 <= proj / cos(pi/num) + M * (1 - bin10(k))];
end

% IBR-11
Constraints = [Constraints, sum(bin11) <= 1];
for k = 1:num
    proj = Vdp11 * cos(Theta_k(k)) + Vqp11 * sin(Theta_k(k));
    Constraints = [Constraints, Vp11 <= proj / cos(pi/num) + M * (1 - bin11(k))];
end
% IBR-12
Constraints = [Constraints, sum(bin12) <= 1];
for k = 1:num
    proj = Vdp12 * cos(Theta_k(k)) + Vqp12 * sin(Theta_k(k));
    Constraints = [Constraints, Vp12 <= proj / cos(pi/num) + M * (1 - bin12(k))];
end
% IBR-16
Constraints = [Constraints, sum(bin16) <= 1];
for k = 1:num
    proj = Vdp16 * cos(Theta_k(k)) + Vqp16 * sin(Theta_k(k));
    Constraints = [Constraints, Vp16 <= proj / cos(pi/num) + M * (1 - bin16(k))];
end
% IBR-21
Constraints = [Constraints, sum(bin21) <= 1];
for k = 1:num
    proj = Vdp21 * cos(Theta_k(k)) + Vqp21 * sin(Theta_k(k));
    Constraints = [Constraints, Vp21 <= proj / cos(pi/num) + M * (1 - bin21(k))];
end

% IBR-22
Constraints = [Constraints, sum(bin22) <= 1];
for k = 1:num
    proj = Vdp22 * cos(Theta_k(k)) + Vqp22 * sin(Theta_k(k));
    Constraints = [Constraints, Vp22 <= proj / cos(pi/num) + M * (1 - bin22(k))];
end

% IBR-23
Constraints = [Constraints, sum(bin23) <= 1];
for k = 1:num
    proj = Vdp23 * cos(Theta_k(k)) + Vqp23 * sin(Theta_k(k));
    Constraints = [Constraints, Vp23 <= proj / cos(pi/num) + M * (1 - bin23(k))];
end


%% eq (9)-(11)
% IBR-4
Constraints = [Constraints (Idp4+Idn4)^2+(Iqn4-Iqp4)^2<= Imax^2];
Constraints = [Constraints (Idp4+cos(pi/3*4)*Idn4+sin(pi/3*4)*Iqn4)^2+(Iqp4+sin(pi/3*4)*Idn4-cos(pi/3*4)*Iqn4)^2<= Imax^2];
Constraints = [Constraints (cos(pi/3*4)*Idp4-sin(pi/3*4)*Iqp4+Idn4)^2+(sin(pi/3*4)*Idp4+cos(pi/3*4)*Iqp4-Iqn4)^2<= Imax^2];
% IBR-8
Constraints = [Constraints (Idp8+Idn8)^2+(Iqn8-Iqp8)^2<= Imax^2];
Constraints = [Constraints (Idp8+cos(pi/3*4)*Idn8+sin(pi/3*4)*Iqn8)^2+(Iqp8+sin(pi/3*4)*Idn8-cos(pi/3*4)*Iqn8)^2<= Imax^2];
Constraints = [Constraints (cos(pi/3*4)*Idp8-sin(pi/3*4)*Iqp8+Idn8)^2+(sin(pi/3*4)*Idp8+cos(pi/3*4)*Iqp8-Iqn8)^2<= Imax^2];
% IBR-10
Constraints = [Constraints, (Idp10+Idn10)^2+(Iqn10-Iqp10)^2<= Imax^2];
Constraints = [Constraints, (Idp10+cos(pi/3 * 4)*Idn10+sin(pi/3 * 4)*Iqn10)^2+(Iqp10+sin(pi/3 * 4)*Idn10-cos(pi/3 * 4)*Iqn10)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp10-sin(pi/3 * 4)*Iqp10+Idn10)^2+(sin(pi/3 * 4)*Idp10+cos(pi/3 * 4)*Iqp10-Iqn10)^2<= Imax^2];
% IBR-11
Constraints = [Constraints, (Idp11+Idn11)^2+(Iqn11-Iqp11)^2<= Imax^2];
Constraints = [Constraints, (Idp11+cos(pi/3 * 4)*Idn11+sin(pi/3 * 4)*Iqn11)^2+(Iqp11+sin(pi/3 * 4)*Idn11-cos(pi/3 * 4)*Iqn11)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp11-sin(pi/3 * 4)*Iqp11+Idn11)^2+(sin(pi/3 * 4)*Idp11+cos(pi/3 * 4)*Iqp11-Iqn11)^2<= Imax^2];
% IBR-12
Constraints = [Constraints, (Idp12+Idn12)^2+(Iqn12-Iqp12)^2<= Imax^2];
Constraints = [Constraints, (Idp12+cos(pi/3 * 4)*Idn12+sin(pi/3 * 4)*Iqn12)^2+(Iqp12+sin(pi/3 * 4)*Idn12-cos(pi/3 * 4)*Iqn12)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp12-sin(pi/3 * 4)*Iqp12+Idn12)^2+(sin(pi/3 * 4)*Idp12+cos(pi/3 * 4)*Iqp12-Iqn12)^2<= Imax^2];
% IBR-16
Constraints = [Constraints, (Idp16+Idn16)^2+(Iqn16-Iqp16)^2<= Imax^2];
Constraints = [Constraints, (Idp16+cos(pi/3 * 4)*Idn16+sin(pi/3 * 4)*Iqn16)^2+(Iqp16+sin(pi/3 * 4)*Idn16-cos(pi/3 * 4)*Iqn16)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp16-sin(pi/3 * 4)*Iqp16+Idn16)^2+(sin(pi/3 * 4)*Idp16+cos(pi/3 * 4)*Iqp16-Iqn16)^2<= Imax^2];

% IBR-21
Constraints = [Constraints, (Idp21+Idn21)^2+(Iqn21-Iqp21)^2<= Imax^2];
Constraints = [Constraints, (Idp21+cos(pi/3 * 4)*Idn21+sin(pi/3 * 4)*Iqn21)^2+(Iqp21+sin(pi/3 * 4)*Idn21-cos(pi/3 * 4)*Iqn21)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp21-sin(pi/3 * 4)*Iqp21+Idn21)^2+(sin(pi/3 * 4)*Idp21+cos(pi/3 * 4)*Iqp21-Iqn21)^2<= Imax^2];

% IBR-22
Constraints = [Constraints, (Idp22+Idn22)^2+(Iqn22-Iqp22)^2<= Imax^2];
Constraints = [Constraints, (Idp22+cos(pi/3 * 4)*Idn22+sin(pi/3 * 4)*Iqn22)^2+(Iqp22+sin(pi/3 * 4)*Idn22-cos(pi/3 * 4)*Iqn22)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp22-sin(pi/3 * 4)*Iqp22+Idn22)^2+(sin(pi/3 * 4)*Idp22+cos(pi/3 * 4)*Iqp22-Iqn22)^2<= Imax^2];

% IBR-23
Constraints = [Constraints, (Idp23+Idn23)^2+(Iqn23-Iqp23)^2<= Imax^2];
Constraints = [Constraints, (Idp23+cos(pi/3 * 4)*Idn23+sin(pi/3 * 4)*Iqn23)^2+(Iqp23+sin(pi/3 * 4)*Idn23-cos(pi/3 * 4)*Iqn23)^2<= Imax^2];
Constraints = [Constraints, (cos(pi/3 * 4)*Idp23-sin(pi/3 * 4)*Iqp23+Idn23)^2+(sin(pi/3 * 4)*Idp23+cos(pi/3 * 4)*Iqp23-Iqn23)^2<= Imax^2];

%% eq (16)
n_sides = 16;       
d = Slim * cos(pi / n_sides); 
theta = linspace(0, 2*pi, n_sides + 1);
phi = (theta(1:end-1) + theta(2:end)) / 2;


% IBR-4
k=1.5;
P4 = k*(Vdp4*Idp4 + Vqp4*Iqp4 + Vdn4*Idn4 + Vqn4*Iqn4);
Q4 = k*(Vqp4*Idp4 - Vdp4*Iqp4 + Vqn4*Idn4 - Vdn4*Iqn4);
Constraints = [Constraints, 0 <= P4];
for i = 1:16
    Constraints = [Constraints, P4*cos(phi(i)) + Q4*sin(phi(i)) <= d];
end

% IBR-8
P8 = k*(Vdp8*Idp8 + Vqp8*Iqp8 + Vdn8*Idn8 + Vqn8*Iqn8);
Q8 = k*(Vqp8*Idp8 - Vdp8*Iqp8 + Vqn8*Idn8 - Vdn8*Iqn8);
Constraints = [Constraints, 0 <= P8];
for i = 1:16
    Constraints = [Constraints, P8*cos(phi(i)) + Q8*sin(phi(i)) <= d];
end

% IBR-10
P10 = k*(Vdp10*Idp10 + Vqp10*Iqp10 + Vdn10*Idn10 + Vqn10*Iqn10);
Q10 = k*(Vqp10*Idp10 - Vdp10*Iqp10 + Vqn10*Idn10 - Vdn10*Iqn10);
Constraints = [Constraints, 0 <= P10];

for i = 1:16
    Constraints = [Constraints, P10*cos(phi(i)) + Q10*sin(phi(i)) <= d];
end

% IBR-11
P11 = k*(Vdp11*Idp11 + Vqp11*Iqp11 + Vdn11*Idn11 + Vqn11*Iqn11);
Q11 = k*(Vqp11*Idp11 - Vdp11*Iqp11 + Vqn11*Idn11 - Vdn11*Iqn11);
Constraints = [Constraints, 0 <= P11];
for i = 1:16
    Constraints = [Constraints, P11*cos(phi(i)) + Q11*sin(phi(i)) <= d];
end

% IBR-12
P12 = k*(Vdp12*Idp12 + Vqp12*Iqp12 + Vdn12*Idn12 + Vqn12*Iqn12);
Q12 = k*(Vqp12*Idp12 - Vdp12*Iqp12 + Vqn12*Idn12 - Vdn12*Iqn12);
Constraints = [Constraints, 0 <= P12];
for i = 1:16
    Constraints = [Constraints, P12*cos(phi(i)) + Q12*sin(phi(i)) <= d];
end

% IBR-16
P16 = k*(Vdp16*Idp16 + Vqp16*Iqp16 + Vdn16*Idn16 + Vqn16*Iqn16);
Q16 = k*(Vqp16*Idp16 - Vdp16*Iqp16 + Vqn16*Idn16 - Vdn16*Iqn16);
Constraints = [Constraints, 0 <= P16];
for i = 1:16
    Constraints = [Constraints, P16*cos(phi(i)) + Q16*sin(phi(i)) <= d];
end

% IBR-21
P21 = k*(Vdp21*Idp21 + Vqp21*Iqp21 + Vdn21*Idn21 + Vqn21*Iqn21);
Q21 = k*(Vqp21*Idp21 - Vdp21*Iqp21 + Vqn21*Idn21 - Vdn21*Iqn21);
Constraints = [Constraints, 0 <= P21];
for i = 1:16
    Constraints = [Constraints, P21*cos(phi(i)) + Q21*sin(phi(i)) <= d];
end

% IBR-22
P22 = k*(Vdp22*Idp22 + Vqp22*Iqp22 + Vdn22*Idn22 + Vqn22*Iqn22);
Q22 = k*(Vqp22*Idp22 - Vdp22*Iqp22 + Vqn22*Idn22 - Vdn22*Iqn22);
Constraints = [Constraints, 0 <= P22];
for i = 1:16
    Constraints = [Constraints, P22*cos(phi(i)) + Q22*sin(phi(i)) <= d];
end

% IBR-23
P23 = k*(Vdp23*Idp23 + Vqp23*Iqp23 + Vdn23*Idn23 + Vqn23*Iqn23);
Q23 = k*(Vqp23*Idp23 - Vdp23*Iqp23 + Vqn23*Idn23 - Vdn23*Iqn23);
Constraints = [Constraints, 0 <= P23];
for i = 1:16
    Constraints = [Constraints, P23*cos(phi(i)) + Q23*sin(phi(i)) <= d];
end
%% Solve
Objective = t;
options = sdpsettings('solver', 'gurobi'); 
sol = optimize(Constraints, Objective, options);

if sol.problem == 0
    disp('Successful!');
    % IBR-4
    disp(['I4dp_ref = ', num2str(value(Idp4)), ';']);
    disp(['I4qp_ref = ', num2str(value(Iqp4)), ';']);
    disp(['I4dn_ref = ', num2str(value(Idn4)), ';']);
    disp(['I4qn_ref = ', num2str(value(Iqn4)), ';']);

    % IBR-8
    disp(['I8dp_ref = ', num2str(value(Idp8)), ';']);
    disp(['I8qp_ref = ', num2str(value(Iqp8)), ';']);
    disp(['I8dn_ref = ', num2str(value(Idn8)), ';']);
    disp(['I8qn_ref = ', num2str(value(Iqn8)), ';']);

    % IBR-10
    disp(['I10dp_ref = ', num2str(value(Idp10)), ';']);
    disp(['I10qp_ref = ', num2str(value(Iqp10)), ';']);
    disp(['I10dn_ref = ', num2str(value(Idn10)), ';']);
    disp(['I10qn_ref = ', num2str(value(Iqn10)), ';']);

    % IBR-11
    disp(['I11dp_ref = ', num2str(value(Idp11)), ';']);
    disp(['I11qp_ref = ', num2str(value(Iqp11)), ';']);
    disp(['I11dn_ref = ', num2str(value(Idn11)), ';']);
    disp(['I11qn_ref = ', num2str(value(Iqn11)), ';']);

    % IBR-12
    disp(['I12dp_ref = ', num2str(value(Idp12)), ';']);
    disp(['I12qp_ref = ', num2str(value(Iqp12)), ';']);
    disp(['I12dn_ref = ', num2str(value(Idn12)), ';']);
    disp(['I12qn_ref = ', num2str(value(Iqn12)), ';']);

    % IBR-16
    disp(['I16dp_ref = ', num2str(value(Idp16)), ';']);
    disp(['I16qp_ref = ', num2str(value(Iqp16)), ';']);
    disp(['I16dn_ref = ', num2str(value(Idn16)), ';']);
    disp(['I16qn_ref = ', num2str(value(Iqn16)), ';']);

    % IBR-21
    disp(['I21dp_ref = ', num2str(value(Idp21)), ';']);
    disp(['I21qp_ref = ', num2str(value(Iqp21)), ';']);
    disp(['I21dn_ref = ', num2str(value(Idn21)), ';']);
    disp(['I21qn_ref = ', num2str(value(Iqn21)), ';']);

    % IBR-22
    disp(['I22dp_ref = ', num2str(value(Idp22)), ';']);
    disp(['I22qp_ref = ', num2str(value(Iqp22)), ';']);
    disp(['I22dn_ref = ', num2str(value(Idn22)), ';']);
    disp(['I22qn_ref = ', num2str(value(Iqn22)), ';']);

    % IBR-23
    disp(['I23dp_ref = ', num2str(value(Idp23)), ';']);
    disp(['I23qp_ref = ', num2str(value(Iqp23)), ';']);
    disp(['I23dn_ref = ', num2str(value(Idn23)), ';']);
    disp(['I23qn_ref = ', num2str(value(Iqn23)), ';']);

    Vp4_r  = sqrt(Vdp4^2  + Vqp4^2);
    Vp8_r  = sqrt(Vdp8^2  + Vqp8^2);
    Vp10_r = sqrt(Vdp10^2 + Vqp10^2);
    Vp11_r = sqrt(Vdp11^2 + Vqp11^2);
    Vp12_r = sqrt(Vdp12^2 + Vqp12^2);
    Vp16_r = sqrt(Vdp16^2 + Vqp16^2);
    Vp21_r = sqrt(Vdp21^2 + Vqp21^2);
    Vp22_r = sqrt(Vdp22^2 + Vqp22^2);
    Vp23_r = sqrt(Vdp23^2 + Vqp23^2);
    disp(['Vp4 = ', num2str(value(Vp4_r))]);
    disp(['Vn4 = ', num2str(value(Vn4))]);
    disp(['Vp8 = ', num2str(value(Vp8_r))]);
    disp(['Vn8 = ', num2str(value(Vn8))]);
    disp(['Vp10 = ', num2str(value(Vp10_r))]);
    disp(['Vn10 = ', num2str(value(Vn10))]);
    disp(['Vp11 = ', num2str(value(Vp11_r))]);
    disp(['Vn11 = ', num2str(value(Vn11))]);
    
   
    disp(['Vp12 = ', num2str(value(Vp12_r))]);
    disp(['Vn12 = ', num2str(value(Vn12))]);
    disp(['Vp16 = ', num2str(value(Vp16_r))]);
    disp(['Vn16 = ', num2str(value(Vn16))]);
    disp(['Vp21 = ', num2str(value(Vp21_r))]);
    disp(['Vn21 = ', num2str(value(Vn21))]);
    disp(['Vp22 = ', num2str(value(Vp22_r))]);
    disp(['Vn22 = ', num2str(value(Vn22))]);
    disp(['Vp23 = ', num2str(value(Vp23_r))]);
    disp(['Vn23 = ', num2str(value(Vn23))]);


    t_r = ( ...
    (Vn4 /Vbase)^2  + lambda*(Vbase^-1*Vp4_r  - 1)^2 + ...
    (Vn8 /Vbase)^2  + lambda*(Vbase^-1*Vp8_r  - 1)^2 + ...
    (Vn10/Vbase)^2  + lambda*(Vbase^-1*Vp10_r - 1)^2 + ...
    (Vn11/Vbase)^2  + lambda*(Vbase^-1*Vp11_r - 1)^2 + ...
    (Vn12/Vbase)^2  + lambda*(Vbase^-1*Vp12_r - 1)^2 + ...
    (Vn16/Vbase)^2  + lambda*(Vbase^-1*Vp16_r - 1)^2 + ...
    (Vn21/Vbase)^2  + lambda*(Vbase^-1*Vp21_r - 1)^2 + ...
    (Vn22/Vbase)^2  + lambda*(Vbase^-1*Vp22_r - 1)^2 + ...
    (Vn23/Vbase)^2  + lambda*(Vbase^-1*Vp23_r - 1)^2 ...
    );

    disp(['Objective t: ', num2str(value(t_r))]);
else
    disp('Infeasible!');
    disp(sol.info);
end
