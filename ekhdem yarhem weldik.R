variablesYesl7o <-  c("hv213","hv206","hv216","hv204","hv205","hv221","hv207","hv208","hv212","hv211","hv209")

varsyesl7o <- rdhs:::search_variables(dataset_names, variablesYesl7o)

#extractyesl7o <-  rdhs::extract_dhs(varsyesl7o)

#final_df_allyesl7o <- plyr::rbind.fill(extractyesl7o)

final_of_alljdidCountry <- final_of_alljdid

#final_of_alljdidCountry$Country <- subset(x = datasets, subset =datasets$SurveyId == final_of_alljdidCountry$SurveyId  )
qusjdid <- rdhs:::search_variable_labels(dataset_names,search_terms = "Electricity|Floor|Water|Toilet|mobile|Telephone|Radio|television|Car|motorcycle|Rooms|refrigerator")

variablejdid <- qusjdid$variable[1:20]

varsjdid <- rdhs:::search_variables(dataset_names, variablejdid)

extractjdid <- rdhs::extract_dhs(varsjdid)

final_of_alljdid <- plyr::rbind.fill(extractjdid)
#final_of_alljdidCountry<- dplyr::left_join(final_of_alljdidCountry,datasets[,c("SurveyId","CountryName")],by="SurveyId")

#final_of_alljdidCountry<- dplyr::left_join(final_of_alljdidCountry,varsyesl7o[,c("survey_id","variable")],by=c("SurveyId"="survey_id"))

#final_of_alljdidCountry<- merge(x = final_of_alljdidCountry, y=datasets[,c("CountryName")], by= "SurveyId",all.x=TRUE)
final_of_alljdidCountry<- merge(x=final_of_alljdidCountry,y=dardatasets[,c("SurveyId","CountryName","SurveyYear")], 
             by.x=c("SurveyId"), 
             by.y=c("SurveyId"),
             all.x=TRUE)
#final_of_alljdidCountry <- final_of_alljdidCountry  %>% semi_join( dardatasets, 
                             by=c('SurveyId'))
dardatasets <- datasets[datasets$FileType == "Household Recode",]
#final_of_alljdidCountry<- dplyr::left_join(final_of_alljdid,dardatasets[,c("SurveyId","CountryName","SurveyYear")],by="SurveyId")
colnames(final_of_alljdidCountry)<-c("Survey Id","Rooms","Electricity","Floors","Water","Toilet","Phone","Radio","Tv","Car","Motorbike","Fridge",'1','2','3','4'
,'5','6','7','8','9','country name','survey year')                  
final_of_final_of_final <- final_of_alljdidCountry[,!names(final_of_alljdidCountry) %in% c('1','2','3','4'
                                                                                           ,'5','6','7','8','9','10')]
