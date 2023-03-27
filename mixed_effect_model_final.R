library(lme4)
library(lmerTest)
library(tidyverse)
library(broom)
install.packages("emmeans")
library("emmeans")

#cite R:
citation()$textVersion
citation('afex')$textVersion
citation('lme4')$textVersion



#load fricative table
df_fri = read_delim('gd_fricatives_recode_cen.txt', delim='\t')
head(df_fri)


md_fri <- lmer(cog ~ syllable_position*phrase_position+
                   filler_target_order*phrase_position+
                   GEPAQ_F.c * sex + TMF.c+
                   (1+syllable_position|speaker)+
                   (1|word), df_fri)
summary(md_fri)
emmeans(md_fri, pairwise ~ GEPAQ_F.c | sex)

#check the multicollinearity
library(car)
vif(md_fri)


#No interaction btw syllable position and phrase position
md_fri_null_1 <- lmer(cog ~ syllable_position+
                        phrase_position+
                        filler_target_order * phrase_position+
                        GEPAQ_F.c * sex + TMF.c+
                        (1+syllable_position|speaker)+
                        (1|word), df_fri, REML = FALSE)
summary(md_fri_null_1)
anova(md_fri, md_fri_null_1)

#no interaction btw phrase position and utterance position
md_fri_null_2 <- lmer(cog ~ syllable_position*phrase_position+
                        filler_target_order+
                        phrase_position+
                        GEPAQ_F.c * sex + TMF.c+
                        (1+syllable_position|speaker)+
                        (1|word), df_fri, REML = FALSE)
anova(md_fri, md_fri_null_2)

tail(df_fri$speaker)
class(df_fri$speaker)
class(df_fri$word)

#no interaction of EPAQ and sex
md_fri_null_3 <- lmer(cog ~ syllable_position*phrase_position+
                        filler_target_order*phrase_position+
                        GEPAQ_F.c + sex + TMF.c+
                        (1+syllable_position|speaker)+
                        (1|word), df_fri, REML = FALSE)
anova(md_fri, md_fri_null_3)

#check random effects
summary(md_fri)$varcor
coef(md_fri)$speaker
coef(md_fri)$word
library(afex)

#returns ANOVA table with F test on fixed effects using Kenward-Roger method
md_fric_afex <- mixed(cog ~ syllable_position*phrase_position+
                   filler_target_order*phrase_position+
                   GEPAQ_F.c * sex + TMF.c+
                   (1+syllable_position|speaker)+
                   (1|word), data = df_fri,
                 method = "LRT")
md_fric_afex

#check intercept and slopes for each fixed effect
fixef(md_fric_afex$full_model)
#R square output
library(MuMIn)
r.squaredGLMM(md_fric_afex$full_model)

#R2m: marginal R square: characterizes the variance described by the fixed effects
#R2c: R square that characterizes the variance described by both fixed and randome effects. 

# partial model with female and male in seperate groups
df_fri_f <- df_fri %>% subset(df_fri$sex == "b_f")
df_fri_m <- df_fri %>% subset(df_fri$sex == "a_m")


# model for female
md_fri_f <- lmer(cog ~ syllable_position*phrase_position+
                 filler_target_order*phrase_position+
                 GEPAQ_F.c + TMF.c+
                 (1+syllable_position|speaker)+
                 (1|word), df_fri_f, REML = FALSE)
summary(md_fri_f)

md_fri_f_emms <- emmeans(md_fri_f, )

md_fri_f_2 <- lmer(cog ~ syllable_position*phrase_position+
                   filler_target_order*phrase_position+
                   TMF.c+
                   (1+syllable_position|speaker)+
                   (1|word), df_fri_f, REML = FALSE)
summary(md_fri_f_2)
anova(md_fri_f, md_fri_f_2)


md_fri_afex_f <- mixed(cog ~ syllable_position + phrase_position+
                         filler_target_order*phrase_position +
                         TMF.c+
                         (1+syllable_position|speaker)+
                         (1|word), data = df_fri_f,
                       method = "LRT")
md_fri_afex_f


# model for male
md_fri_m <- lmer(cog ~ syllable_position*phrase_position+
                   filler_target_order*phrase_position+
                   GEPAQ_F.c + TMF.c+
                   (1+syllable_position|speaker)+
                   (1|word), df_fri_m, REML = FALSE)
summary(md_fri_m)

md_fri_afex_m <- mixed(cog ~ syllable_position*phrase_position+
                         filler_target_order*phrase_position+
                         GEPAQ_F.c + TMF +
                         (1+syllable_position|speaker)+
                         (1|word), data = df_fri_m,
                       method = "LRT")
md_fri_afex_m

#vowel data
df_v = read_delim("gd_vowels_recode_cen.txt", delim = '\t')
head(df_v)

#check whether there is interaction of tmf and sex
md_v_0 <- lmer(v_space_bk ~  consonants +                        
               phrase_position +
               filler_target_order +
               sex * TMF.c +
               (1+phrase_position|speaker), df_v)
summary(md_v_0)
md_v_0_afex <- mixed(v_space_bk ~  consonants +                        
                       phrase_position +
                       filler_target_order +
                       sex * TMF.c +
                      (1+phrase_position|speaker), df_v)
md_v_0_afex

md_v_0_0 <- lmer(v_space_bk ~  consonants +                        
                   phrase_position +
                   filler_target_order +
                   sex + TMF.c +
                   (1+phrase_position|speaker), df_v)
summary(md_v_0_0)

anova(md_v_0, md_v_0_0)

#change reference level to male:
df_v_b <- mutate(df_v,
                 sex = factor(sex),
                 sexRe = relevel(sex, ref = 'b_female'))

md_v_0_b <- lmer(v_space_bk ~  consonants +                        
                 phrase_position +
                 filler_target_order +
                 sexRe * TMF.c +
                 (1+phrase_position|speaker), df_v_b)
summary(md_v_0_b)

md_v_0_afex <- mixed(v_space_bk ~  consonants +                        
                       phrase_position +
                       filler_target_order +
                       sex * TMF.c +
                       (1+phrase_position|speaker), 
                     df_v, method = "LRT")
md_v_0_afex
#chi-square for sex is zero, must be some problems with the model
#therefore interactions of TMF and sex should not be added to the model


md_v <- lmer(v_space_bk ~  consonants +                        
                 phrase_position +
                 filler_target_order +
                 sex +
                 TMF.c +
                 (1+phrase_position|speaker), df_v)
summary(md_v)
library(car)
vif(md_v)

# no sex
md_v_2 <- lmer(v_space_bk.c ~  consonants +                        
               phrase_position +
               filler_target_order +
               TMF.c +
               (1+phrase_position|speaker), df_v)
summary(md_v_2)
anova(md_v, md_v_2)


#no TMF
md_v_3 <- lmer(v_space_bk.c ~  consonants +                        
                 phrase_position +
                 filler_target_order +
                 sex +
                 (1+phrase_position|speaker), df_v)
summary(md_v_3)
anova(md_v, md_v_3)




md_v_afex <- mixed(v_space_bk~  consonants +                        
                     phrase_position +
                     filler_target_order +
                     sex +
                     TMF.c +
                     (1+phrase_position|speaker),
                   data = df_v, method = "LRT")
md_v_afex


# no sex
md_v_afex_2 <- mixed(v_space_bk ~  consonants +                        
                     phrase_position +
                     filler_target_order +
                     TMF.c +
                     (1+phrase_position|speaker),
                   data = df_v, method = "LRT")
md_v_afex_2

# no TMF
md_v_afex_3 <- mixed(v_space_bk ~  consonants +                        
                       phrase_position +
                       filler_target_order +
                       sex +
                       (1+phrase_position|speaker),
                     data = df_v, method = "LRT")
md_v_afex_3


# partial model with only female or male
head(df_v)
df_v_f <- df_v %>% subset(df_v$sex == "b_female")
df_v_m <- df_v %>% subset(df_v$sex == "a_male")

# model for female
md_v_f <- lmer(v_space_bk ~  consonants +                        
               phrase_position +
               filler_target_order +
               TMF.c +
               (1+phrase_position|speaker), df_v_f)
summary(md_v_f)

# model for male
md_v_m <- lmer(v_space_bk ~  consonants +                        
                 phrase_position +
                 filler_target_order +
                 TMF.c +
                 (1+phrase_position|speaker), df_v_m)
summary(md_v_m)

