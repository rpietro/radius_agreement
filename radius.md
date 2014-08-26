# Quasi-experimental, reproducible intervention to improve observer agreement in the classification of distal radius fractures and development of Computerized Adaptive Test


Fabiano Caumo, MD  
Pedro Gaspar Soares Justo, MD   
Henrique Ayzemberg, MD  
Ana Paula Bonilauri Ferreira, DDS, PhD  
Ricardo Pietrobon, MD, PhD  


## Abstract

<!-- write at the end -->

## Introduction

Although the AO classification is considered one of the main pillars behind the education of orthopedic residents, observer agreement has been reported to be poor in a number of previous publications (@andersen1996classification; @belloti2008distal; @kural2010evaluation; @kucuk2013reliability). Although well established, these findings are disconcerting as classifications are supposed to guide treatment indications, and a substantion lack of observer agreement might mean that a large percentage treatment variability might be explained by a simple lack of understanding of the fracture radiological appearance, biomechanics and, as a consequence, treatment. Despite our knowledge of the cognition behind medical diagnosis having substantially improved over the past couple decades, however, to our knowledge these fields have remained largely without an intersection.

The accurate usage of a scale can be evaluated determining how reproducible are the answers from different observers at different times (@garbuz2002classification). According to this criteria, although AO scale is  widely accepted, several studies have found low agreement rates. (@belloti2008distal; @kural2010evaluation; @kucuk2013reliability). These low agreement rates may be reflex of the use of wrong cognitive schema or wrong heuristics. 

Previous studies have found that physicians tend to use heuristics instead of evidence based instruments such as scales (@ferreira2010clinical) in their daily practice. Since medical education is based on several schemas where knowledge is built for future use (@regehr1996issues), learning a coherent cognitive schema that avoids cognitive overload may facilitate the understanding of scales (@ruiter2012achieve; @ferreira2010clinical), thus enhancing its agreement rates and consequently its accurate daily usage. <!-- Ricardo, please check it out -->

The objective of this study was therefore to investigate the intra and interobserver reliability of the AO classification system for distal radius fractures with and without the aid of a cognitive schemata obtained through a cognitive task analysis.


## Methods


### Institutional Review Board

We obtained approval from the Research Ethics Committee of the São José Municipal Hospital prior to the initiation of this project (protocol number 1240.567). All participants were provided with informed consent prior to enrollment in the study.


### Participants

A total of 14 orthopedic residents participated in this study, 6 were first-year, 4 were second-year, and 4 were third-year residents. Their average age was 29, 13 being males.


### Image selection

Two second-year and one fourth-year residents that were not enrolled directly with the study and an orthopedic surgeon, specialist in hand selected 20 images containing fractures with a wide pattern variation chosen to cover the full spectrum of the AO classification for distal radius fractures. As imagens eram na incidência ântero-posterior e perfil. As imagens foram obtidas de arquivos dos Hospital São Municipal São José (Joinville – SC). Qualquer sinal de identicação de pacientes foi removido. Imagens radiográficas mal posicionadas que poderiam gerar problemas na interpretação foram excluídas. Imagens de baixa qualidade ou com artefatos ou outros defeitos técnicos também foram excluídas.


### AO classification


The AO classification is based on the degree of bone fracture, serving as the basis for both treatment indication and outcome assessment (@belloti2008distal). It divides fractures into three main categories: extra-articular, partial articular and complete articular. These three groups are organized in progressive order of severity in relation to their anatomical severity, treatment complexity and prognosis. Fractures from Group A (extra-articular) do not affect the radiocarpal joint surface at all, while Group B (partial articular fracture) does affect the radiocarpal joint leaving a section of the articular surface remaining connected to the diaphysis. Fractures in Group C (complete articular fracture) constitutes a complete separation between the involved articular surface and the diaphysis. 

These three main groups are then subdivided into three subgroup, therefore constituting a total of 27 different types of fractures. These fractures vary in relation to how stable they are, their degree of comminution, how reduceable they are and the localization of their fragments (Müeller, 1987). https://www2.aofoundation.org/wps/portal/surgery?showPage=diagnosis&bone=Radius&segment=Distal )



### Situated schemata extraction using Cognitive Task Analysis

For the purposes of our paper, we define a situated schema as the collection of concepts and situations (e.g., narratives) that an expert hand surgeon relates to each classification category. In order to extract the situated schema from our expert hand surgeon (HA), we used the following sequence. 

First, the AO classification was presented to the hand surgery expert in an electronic format combining text and graphics for each classification category. Second, we asked the surgeon to "think aloud" about what they thought when finding a case in their daily practice. After an initial description, we specifically asked the expert to discuss any diagnostic, biomechanical or related therapeutic decision if it had not yet been previously mentioned. We also encouraged the expert to provide any narratives that might occur to him while thinking aloud about each classification category. The entire process was recorded in a video.

Second, the video was analyzed and a graph constituted by nodes and edges was built using [Graphviz](http://www.graphviz.org/). Each node represented either a concept or a situation, while edges connected relationships among diagnostic, biomechanical and therapeutic nodes.



### Study logistics and procedures

#### Baseline evaluation
At baseline, all participants independently classified all 20 images according to the AO classification. All participants simultaneously gathered in a single room, being instructed not to look at each other's responses or discuss any cases. Each resident received a directory with all images to be classified. All responses were provided in paper sheets, which were subsequently transcribed to a database. Residents were allowed to check the Web for the classification.There was no time limit for making decisions. Study authors did not participate as study subjects. The directory with all images was deleted at the end of the sesssion in order to decrease the odds of recall bias in subsequent evaluations.



#### Pre-intervention, thirty-day evaluation

After 30 days, each study participant received a new directory with the same 20 images, but in a different order. All other procedures were executed exactly as described for the baseline session.

<!-- 
not sure we are going to describe this as it will get confusing

After the classification was finalized, Após finalizada a classificação das 20 imagens, já em seguida eles realizaram 30 exercícios no Concerto. E imediatamente após a realização dos exercícios as 20 imagens foram reclassificadas, dando aos residentes a oportunidade de mudar sua classificação. Assim que finalizaram a reclassificação das imagens o arquivo foi deletado de seus computadores.  -->
<!-- Concordo. -->



#### Intervention
The educational intervention was constituted by weekly sessions where participants completed 15 exercises related to the diagnosis, biomechanics and therapeutic planning of radius fractures. Os residentes, após terem respondido cada exercício, eram apresentados à resposta correta, juntamente com uma explicação justificando tal resposta. Os exercícios estavam organizados, na Plataforma online Edx, em “blocos” de 15 perguntas cada, ou seja, foram criados 4 blocos correspondentes as quatro semanas de intervenção. Os blocos de perguntas foram programados para serem “realised” semanalmente, isto é, os residentes tinham acesso somente a um bloco de perguntas por semana. The full spectrum described by the AO classification was covered based on cognitive schema from our expert hand surgeon (HA) as described in the previous session - Situated schemata extraction using Cognitive Task Analysis.

<--!—Ricardo, please check it out. -->



#### Post-intervention, sixty-day evaluation

After the 4-week intervention period, all participants classified the same 20 images following the same protocol.





### Outcome measurement

Intra-observer agreement was measured by comparing ratings by the same participant between baseline and the thirty 30-day assessment. Baseline inter-observer agreement was measured at the 30-day assessment. The pre-post intervention evaluation was conducted by comparing the 30-day pre-intervention assessment with the 60-day post-intervention assessment.


### Data analysis

All data were extracted directly from [MySQL](http://www.mysql.com/) and [MongoDB](http://www.mongodb.org/) databases connected to the [Open edX](http://code.edx.org/) platforms. Data sets were then merged, also undergoing an exploratory graphical analysis to verify distributions, percentages, means and frequencies/percentages as well as rates of missing data. 

<!-- add analysis strategy -->


### Computerized Adaptive Test

<!-- this section won't go into the SBOT -->

Based on the values obtained for the interobserver agreement for each individual fracture, we developed a free, publicly available online Computerized Adaptive Test. In this system, learners will initially be asked to rate an image with average observer agreement. Depending on their response agreeing or not with the majority of responders, they are taken to, respectively, a subsequent image with a lower or greater degree of interobserver ("harder" or "easier" images). 

## Results



### Inter-observer reliability


### Intra-observer reliability


### Degree of improvement in inter-observer reliability after training


### Computerized Adaptive Test



## Discussion

To the best of our knowledge, this is the first study creating a computerized adaptive test for the AO radius fracture classification. We found that 

<!-- inter-observer reliability
intra-observer reliability
degree of improvement in inter-observer reliability after training
CAT
 -->

Despite being the first to report a computerized adaptive test for the AO radius fracture classification, our study has limitations. First, our analysis was restricted to a group of residents, and different groups might present a variation in observer agreement serving as the basis for the Computerized Adaptive Test. Second, while selecting images for the observer agreement study, we chose to select a wide spectrum of fractures rather than representing the actual prevalence of these fractures in an average practice. 




http://goo.gl/NwMNN
http://goo.gl/17QP



## References




---


# mysql commands

## below to both create root pwd as well as login as root
mysql --user=root --password=
CREATE USER 'rpietro'@'localhost' IDENTIFIED BY '';

CREATE DATABASE radius;
SHOW DATABASES;
-- DROP DATABASE radius;

mysql -u root -p  radius < staging.sql


SELECT VERSION();
HELP;
HELP contents;
quit


USE radius;
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM radius.courseware_studentmodule INTO OUTFILE '/Users/rpietro/Desktop/ana.csv';



# mongodb commands

mongorestore edxapp

show databases
use edxapp
db
show collections

/*
fs.chunks
fs.files
modulestore
modulestore.location_map
system.indexes
*/

db..findOne()
