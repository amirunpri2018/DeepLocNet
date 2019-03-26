%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mat file description:

% mseFSHC - list of all MSE recorded for the 10 trials of FS with Hard
% Classification

% errFSHC - waypoint wise error during one run of FS with Hard Classification
% errHC - waypoint wise error during one run of PF with Hard Classification

% map - map used for the experiment
% HC - Hard Classification
% SC - Soft Classification
% NC - No Classification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all

load('2D plots.mat')

fsize = 18; % font size
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');

pathUnit = 0.25;
% plot boxplots
figure(1); hold on; grid on;
boxplot([msePFNC'*pathUnit, msePFHC'*pathUnit, msePFSC'*pathUnit, mseFSNC'*pathUnit, mseFSSC'*pathUnit, mseFSHC'*pathUnit], 'Labels', {'PF', 'PF-HC', 'PF-SC', 'FS', 'FS-HC', 'FS-SC'})
% title("RMSE for different experiments in 50 trials", 'fontsize', fsize, 'Interpreter','latex')
ylabel('Position RMSE (m)', 'fontsize', fsize, 'Interpreter','latex')
set(gca,'fontsize',fsize)
set(gca,'TickLabelInterpreter','latex')
figuresize(21,10,'cm')
print -painters -dpdf -r600 boxplot_50trials.pdf

PFNC = [0.0, 1.5704917042973128, 2.361641133797462, 2.733364697361999, 4.69373962912624, 6.916591934839495, 9.064885639661101, 9.179731177285193, 9.35471521970701, 7.735399402439019, 7.068409315701284, 6.670114584080873, 10.87402276305423, 3.6734751414370326, 11.834573471980327, 11.465240962686789, 6.986707032495491, 7.515018150003904, 4.587696862505027, 7.421633207509479, 8.30761936927418, 1.8679455872950426, 0.605851635541229, 0.5988339537326706, 2.5791940813625107, 0.6885686184153209, 2.7256008259905986, 7.930370575429546, 10.965608437855861, 12.266031946095818, 12.716197867331648, 13.26832531010068, 1.477196726748502, 21.12847259212093, 19.48791516679415, 18.691991953783376];
PFSC = [0.0, 0.0035291969504706146, 0.11566133100242526, 0.24669138117917994, 1.0002163422135424, 2.2688434440808356, 3.5565655506763334, 3.901285904590718, 3.654764918461337, 1.693149359373642, 3.286643342290425, 3.0231976437688797, 1.8086684949676008, 0.5281831092141162, 0.45160420359330616, 1.2695442307033418, 1.6262366745017318, 1.737157033382351, 2.01585202583927, 1.879890494509853, 2.126732864894627, 2.3848986465195297, 1.7442477114425616, 1.499613629029022, 0.9662695874218281, 1.2864566454280952, 2.293231996375566, 4.495258700129868, 5.186087669696257, 6.063299482484391, 5.902115447023931, 6.155605211529861, 6.439664647642074, 7.381839461516717, 8.461351276549248, 8.738367990713298];
PFHC = [0.0, 0.022333328012394404, 0.49493115401373255, 0.4113035067074272, 1.803182007903961, 2.2773830197885276, 1.5250380611659098, 1.4056341687066742, 1.5241288495153884, 1.4076327039761134, 2.741067034625399, 3.0295894972190998, 3.260578917323173, 2.928262721683138, 3.5642265731043437, 3.6490114457432963, 3.870960945282284, 5.345420817105801, 6.144764597534386, 6.442732103552406, 6.761619760596929, 5.692582753410074, 6.170257964064833, 5.9594050772520655, 2.5766365910351174, 2.813910119513102, 3.312126515316011, 3.06655682465808, 3.7567396077786004, 3.5364409663444993, 2.361504139621258, 2.995967970687122, 5.194631364062226, 5.098713439951034, 5.286902645996234, 4.850852552836708, 4.745885467800136];
% plot errors in PF
figure(2); hold on; grid on;
plot(PFNC*pathUnit, '--x', 'linewidth', 2)
plot(PFHC*pathUnit, '-.o', 'linewidth', 2)
plot(PFSC*pathUnit, 'k-s', 'linewidth', 2)
% title('Error per Waypoint using Particle Filters', 'fontsize', fsize, 'Interpreter','latex')
xlabel('Waypoints in path', 'fontsize', fsize, 'Interpreter','latex')
ylabel('Position error (m)', 'fontsize', fsize, 'Interpreter','latex')
legend('No Classification', 'Hard Classification', 'Soft Classification', 'location', 'best', 'fontsize', fsize, 'Interpreter','latex')
set(gca, 'fontsize', fsize)
axis tight
figuresize(21,10,'cm')
% print -opengl -dpng -r600 pf_position_error.png

%{
% Old Data
FSNC = [0.0, 0.167106390700584, 10.576185028509624, 12.530102803576346, 11.922291928537796, 11.108428675591728, 11.27315236556032, 13.967738625114817, 11.443365677633036, 12.341991694286634, 10.618618503900839, 13.134884204288028, 10.573166248294926, 9.121201222913745, 6.016652924916055, 8.370452928161635, 5.119781020880964, 2.5747804814739172, 2.8028938441522744, 2.6522692857238575, 1.8218715197747288, 4.248351591947713, 4.652020660706839, 3.849117267726056, 2.6255652558572526, 3.8627599805524517, 3.0471765592955435, 6.12816966803329, 7.873686235118006, 13.08779859156322, 11.40633044483822, 14.064429154025108, 17.315517480774353, 17.97904191227059, 18.670746133443224];
wayptsNC = [[20, 80]; [21, 78]; [22, 76]; [22, 74]; [20, 73]; [21, 71]; [20, 69]; [19, 67]; [18, 65]; [19, 63]; [20, 61]; [20, 59]; [19, 57]; [19, 55]; [18, 53]; [19, 51]; [19, 49]; [19, 47]; [18, 45]; [17, 43]; [18, 41]; [18, 39]; [16, 38]; [16, 36]; [17, 34]; [18, 32]; [18, 30]; [19, 28]; [19, 26]; [17, 25]; [18, 23]; [18, 21]; [20, 20]; [20, 18]; [19, 16]; [18, 15]];
locNC = [[20, 80]; [20.970590734540966, 77.83550185132307]; [19.218410333902035, 65.7961552007722]; [19.138573454728572, 61.80099535231633]; [18.051182982442786, 61.23806320960035]; [19.2482481752396, 60.030562768074326]; [18.719506106643188, 57.7998080531531]; [20.233758206509197, 53.08685646636981]; [19.80536251717838, 53.69994317653238]; [19.886614636819306, 50.68989547292071]; [19.745509003623695, 50.384431561892285]; [19.949088070294433, 45.865214465570105]; [19.092707139988878, 46.427240194713676]; [20.00571490606155, 45.93441401361121]; [19.180892767657976, 47.10037249564059]; [18.83653012967394, 42.631143457791545]; [18.065461509895997, 43.96623445994084]; [19.060764265731926, 44.42593663019165]; [19.990558082025977, 43.02670518582048]; [18.947877056309718, 41.19991463049767]; [19.279021774871232, 42.29742789162694]; [18.389181233865877, 43.230488058842774]; [18.769800364021027, 41.737579721037704]; [19.727220720303116, 35.03899560726809]; [19.213920251955532, 35.41143545043545]; [19.79537443478652, 35.42016743833874]; [18.40403126246221, 33.02027212722189]; [19.911000541285446, 34.06007768052365]; [19.421116767042097, 33.86241665123407]; [21.257408047256728, 37.375982736432604]; [18.669587259744777, 34.3866600510611]; [21.130828137384512, 34.7115310087077]; [20.791889530967076, 37.29740028437068]; [20.873337024536454, 35.95781808919882]; [21.432329447880107, 34.511632414145986]; [20.678976139941394, 33.3226123840666]];
mseNC = 6.841;

FSSC = [0.0, 0.0028327830676460157, 0.003936291833530211, 0.509886447324076, 0.6101743953871799, 0.024759225072866, 0.003081201795612896, 0.027601796308443546, 0.03307948386526916, 0.00891107214791795, 0.019536864054080068, 0.04623386814451995, 0.0588708625019768, 0.10669738458048264, 1.4305832517018382, 3.021254006750648, 5.099836033065222, 0.14730125578259903, 0.972295299808032, 1.8667674636702407, 3.5012720228848346, 4.623424995634455, 3.0928685328388497, 4.821629044793561, 1.8597506736104301, 0.4721185225822953, 2.2616424553339667, 1.5473361732245727, 1.3468056140707976, 1.4885441282970813, 1.5743947567864627, 2.518464172412122, 2.907521365900533, 2.9059649713675326, 2.9109433965855933, 2.9281651241066737, 2.9224902304472757];
wayptsSC = [[20, 80]; [20, 78]; [19, 76]; [20, 74]; [20, 72]; [18, 71]; [18, 69]; [18, 67]; [19, 65]; [20, 63]; [19, 61]; [19, 59]; [18, 57]; [18, 55]; [19, 53]; [19, 51]; [21, 50]; [21, 48]; [20, 46]; [20, 44]; [20, 42]; [20, 40]; [22, 39]; [22, 37]; [21, 35]; [21, 33]; [23, 32]; [23, 30]; [22, 28]; [23, 26]; [21, 25]; [22, 23]; [23, 21]; [23, 19]; [22, 17]; [21, 15]; [22, 13]; [20, 13]];
locSC = [[20, 80]; [19.999641219975498, 77.99719002903888]; [19.00022162856354, 75.99606995239488]; [19.96977631049998, 74.50898989946538]; [19.988119458730527, 71.38994127698618]; [17.998781297192284, 70.9752707867154]; [17.99694519537241, 68.99959754106725]; [17.994965458720028, 67.02713876477574]; [18.99724478759312, 65.03296454242646]; [19.992723958023923, 63.00514455245748]; [18.992360926003897, 61.017981479515036]; [18.993258775947112, 59.045739768931135]; [17.99482016995593, 57.05864254268397]; [17.99268391823446, 55.10644626261131]; [18.89336103191964, 54.426603158042404]; [18.78298060906142, 54.013449577687254]; [21.0685633367228, 55.09937512181717]; [21.04214519916236, 47.858856661004864]; [20.373845415821357, 46.897550976322876]; [20.441367614730602, 45.813839957682276]; [20.467130037895306, 45.46997050505217]; [20.565826575310677, 44.58867072003752]; [22.46588109937646, 42.05757919973768]; [22.462927776503474, 41.79935459404058]; [21.43986747568458, 36.806983445366704]; [21.470821384646452, 32.96502682277964]; [23.263042909638035, 34.24629361915539]; [23.312821064887594, 31.51538517028901]; [22.42438383381489, 29.278195495098146]; [23.465323402933066, 27.413944041527284]; [21.566520585294718, 26.46893610365939]; [22.20995619518534, 25.509697229513307]; [22.904711403582102, 23.905959493275983]; [22.904649030075102, 21.904400214734444]; [21.9045910052074, 19.909379415242697]; [20.903376736208184, 17.92657050810823]; [21.90341406859146, 15.920893751048421]; [19.72730979402096, 16.84055994059679]];
mseSC = 1.558;


FSHC =  [0.0, 0.0033641820405264223, 1.0018678161568708, 0.3812332816610188, 0.22770512212802294, 0.2995145130684195, 0.32298351596877195, 0.351170429825156, 0.3102336289553112, 0.32513227257570576, 0.35114925042181905, 0.560248442693154, 1.4883945832281913, 1.4147802081409409, 2.826837441870743, 1.0402100567804473, 0.4582318182929516, 1.7994765716670273, 2.2516191368935083, 3.4732213306184434, 3.86008835532012, 4.356569547729013, 4.814398096100671, 2.2441498768439256, 1.3532603502350689, 0.3099667696774792, 2.705655477231196, 2.6622045414000377, 3.3399156992370815, 3.21204317242663, 0.9529384912932212, 2.39578656257637, 4.670635259456638, 0.31233271860641904, 1.9439516315110006];
wayptsHC = [[20, 80]; [19, 78]; [18, 76]; [18, 74]; [19, 72]; [20, 70]; [19, 68]; [20, 66]; [20, 64]; [19, 62]; [19, 60]; [20, 58]; [19, 56]; [20, 54]; [21, 52]; [22, 50]; [21, 48]; [22, 46]; [21, 44]; [21, 42]; [21, 40]; [22, 38]; [21, 36]; [22, 34]; [22, 32]; [23, 30]; [23, 28]; [23, 26]; [22, 24]; [21, 22]; [23, 21]; [23, 19]; [22, 17]; [22, 15]; [20, 14]; [18, 15]];
locHC = [[20, 80]; [18.999677561251357, 77.99665130561932]; [18.04414470205136, 74.9991052171523]; [18.137251928816422, 74.3556694013859]; [19.015028188331975, 72.2272086622442]; [20.022233109221077, 70.29868818589455]; [19.023682152600312, 68.3221141214473]; [20.020629149712505, 66.35056398697773]; [20.020480824675243, 64.30955684511153]; [19.01938870311833, 62.32455365174595]; [19.02310143251464, 60.35038852704901]; [20.015461306076194, 58.56003505743348]; [19.005501566698257, 57.48838441544746]; [20.019933229831956, 55.414639778776134]; [21.020771313195798, 54.82676112809527]; [22.410145139949194, 49.04406175596787]; [21.012027980211954, 48.45807393179277]; [22.723927839360332, 47.64743570902709]; [21.403441087064728, 46.215180359901446]; [21.080786866780514, 45.47228165528356]; [21.28125539982339, 43.84982824434392]; [22.179086454746976, 42.352887118445175]; [21.2194847567406, 31.19060757794747]; [22.10831659428374, 31.758465662734256]; [22.027455402042484, 30.647018190655533]; [23.284658819263402, 29.877326633208927]; [23.377344625114876, 25.32078694476007]; [23.15726900761129, 23.342444830394683]; [22.279568383478736, 20.671805534983058]; [21.119757187715273, 18.7901901057036]; [23.402891532054678, 21.863579864046653]; [23.2176377074424, 21.38588077692929]; [22.357952614469326, 21.65689850143571]; [22.287213117936563, 14.877279374198]; [20.394962814874088, 15.903405453528233]; [18.11240173606945, 15.289005316716397]];
mseHC = 1.657;
%}

% New Data
FSNC = [0.0, 0.0729135698045409, 4.631149025076532, 6.787594908719723, 6.303300889065313, 6.496554568638133, 10.573320539431887, 12.892036724397908, 12.708262701971716, 5.50195545432715, 7.9874851127723066, 9.332644775551012, 7.662004123568625, 7.090029890570098, 15.41763296016681, 15.120543910179949, 33.01449636423327, 20.73756244318509, 19.760924471353064, 17.766855217264062, 10.987688872541417, 8.123304105479962, 8.059103536340018, 7.665911850711865, 10.51911954267727, 5.742411430334578, 7.301073706980055, 7.153432500790619, 16.795705148521453, 13.34858362596071, 23.55288356576664, 1.9509934436540013, 4.242628105046374, 10.254275448758085, 5.981580573551818, 9.078615159110143];
mseNC = 10.29484939629173;
FSHC = [0.0, 0.0028045482801270388, 0.9471396074654981, 0.2991703937500125, 0.7113799519455066, 0.7005031003131723, 0.7120852761882981, 0.7074862277721591, 0.7418311732461763, 0.7214391556494979, 0.7004618612149872, 1.0030002370367197, 0.2337635518491153, 2.1252768457423885, 3.1850964800247383, 2.4079602684884125, 4.944029931677133, 3.2765771876858865, 3.4436077699996286, 3.579443297139353, 2.1609307282141095, 2.289966229223411, 2.0710094007819144, 2.3194929318584534, 1.8353940931704407, 1.8760720017620374, 2.055150961229268, 2.1314880798136064, 2.099004548197567, 1.8971254275602367, 1.6978809318299228, 1.551551429374484, 2.6523544303985864, 2.4488694801137276];
mseHC = 1.7508631629116642;
FSSC = [0.0, 0.006562188634505796, 0.01907014599547917, 0.44580460340632233, 0.14428945886493455, 0.5835116359951208, 0.3873307316556461, 0.07653253201171958, 0.1594645680834616, 0.22689385883491395, 0.21254797251471857, 0.26749385012486987, 0.5842540578960977, 0.9058342981049577, 1.7593424462041372, 2.0106511474568025, 1.6461443922711818, 1.247634324362266, 1.2420193713776557, 1.2922625232531932, 0.36615863803877785, 7.128463309179595, 8.307591877222823, 8.486479688672846, 8.177331946875974, 6.485708435166912, 3.0309836620149957, 3.0292798029127606, 2.9650790135467395, 2.9108336121175085, 2.8799659020910924, 2.0966056795469306, 1.2275678069382134, 0.5550449182848332, 2.742508528422701];
mseSC = 2.1030641979451623;

figure(3); hold on; grid on;
plot(FSNC*pathUnit, '--x', 'linewidth', 2)
plot(FSHC*pathUnit, '-o', 'linewidth', 2)
plot(FSSC*pathUnit, 'k-s', 'linewidth', 2)

%{
% plot experimental results instead
% plot errors in FS
cdfNC = [0.0, 0.0439705354146569, 0.6394613507823881, 0.5529615338516642, 1.1751046451455471, 1.2630677497422318, 1.4604410362188969, 7.439147618764561, 1.9123757017607455, 1.242534470694676, 0.7910772551121804, 0.5010438980113504, 0.37563605548928175, 0.6710638362469558, 1.0526779003131919, 0.3327328835273142, 0.3145605703760745, 0.5898551219915926, 1.5631356785731416, 3.3953774544470523, 5.029819528029897];
cdfSC = [0.0, 0.013086052918235797, 0.050644756283121185, 0.09684988042423075, 0.09527270466410015, 0.19509668241989328, 0.15664690842058998, 0.5774693774690566, 0.03660741215036785, 0.18206965162483008, 0.1232342176023067, 0.2514343136598585, 0.2141679588593923, 0.398484952740227, 0.4495579625887233, 0.35885608861164164, 0.4344001019902068, 0.385880431427856, 0.4328265435643725, 0.24242119112938929, 0.10185138239087686];
cdfHC = [0.0, 0.02648773512644154, 0.05482512790739829, 0.09054668900060071, 0.06220362396904202, 0.1725464897843429, 0.13885859439801332, 1.739018365047584, 0.10742245371000943, 0.13860411115465734, 0.2533438480178933, 0.4107888048589951, 0.42960515856520964, 0.6578066725892953, 0.8804104823591694, 0.8848173677532519, 0.9511794234916388, 0.9166994368801922, 0.6077177217857996, 0.20816476656679644, 0.5168340870871974];

plot(cdfNC, '--x', 'linewidth', 2)
plot(cdfHC, '-o', 'linewidth', 2)
plot(cdfSC, 'k-s', 'linewidth', 2)
%}

% title('Error per Waypoint using Fast SLAM', 'fontsize', fsize, 'Interpreter','latex')
xlabel('Waypoints in path', 'fontsize', fsize, 'Interpreter','latex')
ylabel('Position error (m)', 'fontsize', fsize, 'Interpreter','latex')
legend('No Classification', 'Hard Classification', 'Soft Classification', 'location', 'best', 'fontsize', fsize, 'Interpreter','latex')
set(gca, 'fontsize', fsize)
axis tight
figuresize(21,10,'cm')
% print -opengl -dpng -r600 fs_position_error.png