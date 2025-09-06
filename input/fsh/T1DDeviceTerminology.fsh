// T1D Exchange Device Terminology
// Comprehensive device manufacturer and model codes from T1D Exchange specifications

// ============================================================================
// DEVICE TYPE CODES
// ============================================================================

CodeSystem: T1DDeviceTypeCS
Id: t1d-device-type-cs
Title: "T1D Device Type Code System"
Description: "Types of T1D devices"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #insulin-pump "Insulin Pump" "Insulin delivery pump device"
* #cgm "Continuous Glucose Monitor" "Continuous glucose monitoring device"
* #bgm "Blood Glucose Meter" "Blood glucose meter device"
* #insulin-pen "Insulin Pen" "Insulin pen delivery device"

ValueSet: T1DDeviceTypeVS
Id: t1d-device-type-vs
Title: "T1D Device Type Value Set"
Description: "Types of T1D devices"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DDeviceTypeCS

// ============================================================================
// INSULIN PUMP COMPANIES
// ============================================================================

CodeSystem: T1DInsulinPumpCompanyCS
Id: t1d-insulin-pump-company-cs
Title: "T1D Insulin Pump Company Code System"
Description: "Insulin pump manufacturers from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Accu-Chek" "Accu-Chek insulin pump manufacturer"
* #2 "Animas" "Animas insulin pump manufacturer"
* #3 "Deltec" "Deltec insulin pump manufacturer"
* #4 "Insulet" "Insulet insulin pump manufacturer"
* #5 "Medtronic" "Medtronic insulin pump manufacturer"
* #6 "Tandem" "Tandem insulin pump manufacturer"
* #7 "Asante" "Asante insulin pump manufacturer"
* #8 "Sooil" "Sooil insulin pump manufacturer"
* #99 "Other" "Other insulin pump manufacturer"
* #100 "Unknown" "Unknown insulin pump manufacturer"

ValueSet: T1DInsulinPumpCompanyVS
Id: t1d-insulin-pump-company-vs
Title: "T1D Insulin Pump Company Value Set"
Description: "Insulin pump manufacturers"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DInsulinPumpCompanyCS

// ============================================================================
// INSULIN PUMP MODELS
// ============================================================================

CodeSystem: T1DInsulinPumpModelCS
Id: t1d-insulin-pump-model-cs
Title: "T1D Insulin Pump Model Code System"
Description: "Insulin pump models from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Accu-Chek Models
* #accu-chek-spirit "Spirit (for Accu-Chek)" "Accu-Chek Spirit insulin pump"
* #accu-chek-spirit-combo "Spirit Combo (for Accu-Chek)" "Accu-Chek Spirit Combo insulin pump"

// Animas Models
* #animas-ir-1200 "IR-1200 (for Animas)" "Animas IR-1200 insulin pump"
* #animas-ping "Ping (for Animas)" "Animas Ping insulin pump"
* #animas-vibe "Vibe (for Animas)" "Animas Vibe insulin pump"

// Deltec Models
* #deltec-cozmo "Cozmo (for Deltec)" "Deltec Cozmo insulin pump"

// Insulet Models
* #insulet-omnipod "OmniPod (for Insulet)" "Insulet OmniPod insulin pump"
* #insulet-omnipod-5 "OmniPod 5 (for Insulet)" "Insulet OmniPod 5 insulin pump"

// Medtronic Models
* #medtronic-530g "Minimed 530G (for Medtronic)" "Medtronic Minimed 530G insulin pump"
* #medtronic-630g "Minimed 630G (for Medtronic)" "Medtronic Minimed 630G insulin pump"
* #medtronic-670g-manual "Minimed 670G (for Medtronic) (Manual)" "Medtronic Minimed 670G insulin pump in manual mode"
* #medtronic-670g-auto "Minimed 670G (for Medtronic) (Auto)" "Medtronic Minimed 670G insulin pump in auto mode"
* #medtronic-770g-manual "Minimed 770G (for Medtronic) (Manual)" "Medtronic Minimed 770G insulin pump in manual mode"
* #medtronic-770g-auto "Minimed 770G (for Medtronic) (Auto)" "Medtronic Minimed 770G insulin pump in auto mode"
* #medtronic-780g-manual "Minimed 780G (for Medtronic) (Manual)" "Medtronic Minimed 780G insulin pump in manual mode"
* #medtronic-780g-auto "Minimed 780G (for Medtronic) (Auto)" "Medtronic Minimed 780G insulin pump in auto mode"
* #medtronic-paradigm-511 "Paradigm 511 (for Medtronic)" "Medtronic Paradigm 511 insulin pump"
* #medtronic-paradigm-512 "Paradigm 512 (for Medtronic)" "Medtronic Paradigm 512 insulin pump"
* #medtronic-paradigm-515 "Paradigm 515 (for Medtronic)" "Medtronic Paradigm 515 insulin pump"
* #medtronic-paradigm-522 "Paradigm 522 (for Medtronic)" "Medtronic Paradigm 522 insulin pump"
* #medtronic-paradigm-523 "Paradigm 523 (for Medtronic)" "Medtronic Paradigm 523 insulin pump"
* #medtronic-paradigm-712 "Paradigm 712 (for Medtronic)" "Medtronic Paradigm 712 insulin pump"
* #medtronic-paradigm-715 "Paradigm 715 (for Medtronic)" "Medtronic Paradigm 715 insulin pump"
* #medtronic-paradigm-722 "Paradigm 722 (for Medtronic)" "Medtronic Paradigm 722 insulin pump"
* #medtronic-paradigm-723 "Paradigm 723 (for Medtronic)" "Medtronic Paradigm 723 insulin pump"

// Tandem Models
* #tandem-t-slim "T:slim (for Tandem)" "Tandem T:slim insulin pump"
* #tandem-t-flex "T: flex (for Tandem)" "Tandem T:flex insulin pump"
* #tandem-t-slim-g4 "T:slim G4 (for Tandem)" "Tandem T:slim G4 insulin pump"
* #tandem-t-slim-x2 "T:slim X2 (for Tandem)" "Tandem T:slim X2 insulin pump"
* #tandem-t-slim-x2-control-iq "T:slim X2 (with control-IQ)" "Tandem T:slim X2 with control-IQ insulin pump"
* #tandem-t-slim-x2-basal-iq "T:slim X2 (with Basal-IQ)" "Tandem T:slim X2 with Basal-IQ insulin pump"

// Asante Models
* #asante-snap "Snap (for Assante)" "Asante Snap insulin pump"

// Sooil Models
* #sooil-dana-diabecare-ii "DANA Diabecare II (for Sooil)" "Sooil DANA Diabecare II insulin pump"

// Other/Unknown
* #99 "Other" "Other insulin pump model"
* #100 "Unknown" "Unknown insulin pump model"

ValueSet: T1DInsulinPumpModelVS
Id: t1d-insulin-pump-model-vs
Title: "T1D Insulin Pump Model Value Set"
Description: "Insulin pump models"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DInsulinPumpModelCS

// ============================================================================
// PUMP DELIVERY SYSTEMS
// ============================================================================

CodeSystem: T1DPumpDeliverySystemCS
Id: t1d-pump-delivery-system-cs
Title: "T1D Pump Delivery System Code System"
Description: "Insulin pump delivery system types from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Open loop" "Open loop insulin pump delivery"
* #2 "Low glucose suspend" "Low glucose suspend insulin pump delivery"
* #3 "Predictive low glucose suspend" "Predictive low glucose suspend insulin pump delivery"
* #4 "Hybrid closed loop" "Hybrid closed loop insulin pump delivery"
* #5 "Closed loop" "Closed loop insulin pump delivery"
* #99 "Other" "Other insulin pump delivery system"
* #100 "Unknown" "Unknown insulin pump delivery system"

ValueSet: T1DPumpDeliverySystemVS
Id: t1d-pump-delivery-system-vs
Title: "T1D Pump Delivery System Value Set"
Description: "Insulin pump delivery system types"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DPumpDeliverySystemCS

// ============================================================================
// CGM COMPANIES
// ============================================================================

CodeSystem: T1DCGMCompanyCS
Id: t1d-cgm-company-cs
Title: "T1D CGM Company Code System"
Description: "CGM manufacturers from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Dexcom" "Dexcom CGM manufacturer"
* #2 "Medtronic" "Medtronic CGM manufacturer"
* #3 "Abbott" "Abbott CGM manufacturer"
* #4 "Senseonics" "Senseonics CGM manufacturer"
* #99 "Other" "Other CGM manufacturer"
* #100 "Unknown" "Unknown CGM manufacturer"

ValueSet: T1DCGMCompanyVS
Id: t1d-cgm-company-vs
Title: "T1D CGM Company Value Set"
Description: "CGM manufacturers"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DCGMCompanyCS

// ============================================================================
// CGM MODELS
// ============================================================================

CodeSystem: T1DCGMModelCS
Id: t1d-cgm-model-cs
Title: "T1D CGM Model Code System"
Description: "CGM models from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Dexcom Models
* #dexcom-g4 "G4 (for Dexcom)" "Dexcom G4 CGM"
* #dexcom-g5 "G5 (for Dexcom)" "Dexcom G5 CGM"
* #dexcom-g6 "G6 (for Dexcom)" "Dexcom G6 CGM"

// Medtronic Models
* #medtronic-enlite "Enlite (for Medtronic)" "Medtronic Enlite CGM"
* #medtronic-guardian "Guardian (for Medtronic)" "Medtronic Guardian CGM"
* #medtronic-guardian-3 "Guardian 3 (for Medtronic)" "Medtronic Guardian 3 CGM"

// Abbott Models
* #abbott-freestyle-libre "Freestyle Libre (Abbott)" "Abbott Freestyle Libre CGM"

// Senseonics Models
* #senseonics-eversense "Eversense (for Senseonics)" "Senseonics Eversense CGM"

// Other/Unknown
* #99 "Other" "Other CGM model"
* #100 "Unknown" "Unknown CGM model"

ValueSet: T1DCGMModelVS
Id: t1d-cgm-model-vs
Title: "T1D CGM Model Value Set"
Description: "CGM models"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DCGMModelCS

// ============================================================================
// BGM COMPANIES
// ============================================================================

CodeSystem: T1DBGMCompanyCS
Id: t1d-bgm-company-cs
Title: "T1D BGM Company Code System"
Description: "BGM manufacturers from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Abbott Diabetes / FreeStyle" "Abbott Diabetes / FreeStyle BGM manufacturer"
* #2 "Accu-Chek / Roche" "Accu-Chek / Roche BGM manufacturer"
* #3 "Arkray USA" "Arkray USA BGM manufacturer"
* #4 "Bayer / Contour" "Bayer / Contour BGM manufacturer"
* #5 "Caresens" "Caresens BGM manufacturer"
* #6 "CVS" "CVS BGM manufacturer"
* #7 "Walgreens" "Walgreens BGM manufacturer"
* #8 "OneTouch / LifeScan" "OneTouch / LifeScan BGM manufacturer"
* #9 "Prodigy" "Prodigy BGM manufacturer"
* #10 "Rite Aid" "Rite Aid BGM manufacturer"
* #11 "Trividia Health / Nipro" "Trividia Health / Nipro BGM manufacturer"
* #12 "Walmart" "Walmart BGM manufacturer"
* #99 "Other" "Other BGM manufacturer"
* #100 "Unknown" "Unknown BGM manufacturer"

ValueSet: T1DBGMCompanyVS
Id: t1d-bgm-company-vs
Title: "T1D BGM Company Value Set"
Description: "BGM manufacturers"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DBGMCompanyCS

// ============================================================================
// BGM MODELS (40+ models)
// ============================================================================

CodeSystem: T1DBGMModelCS
Id: t1d-bgm-model-cs
Title: "T1D BGM Model Code System"
Description: "BGM models from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Abbott Models
* #abbott-freestyle-freedom-lite "FreeStyle Freedom Lite (for Abbott)" "Abbott FreeStyle Freedom Lite BGM"
* #abbott-freestyle-insulinx "FreeStyle Insulinx (for Abbott)" "Abbott FreeStyle Insulinx BGM"
* #abbott-freestyle-lite "FreeStyle Lite (for Abbott)" "Abbott FreeStyle Lite BGM"
* #abbott-freestyle-optium-neo "FreeStyle Optium Neo (for Abbott)" "Abbott FreeStyle Optium Neo BGM"
* #abbott-freestyle-precision-neo "FreeStyle Precision Neo (for Abbott)" "Abbott FreeStyle Precision Neo BGM"

// Roche Models
* #roche-accu-chek-aviva "Accu-Chek Aviva (for Roche)" "Roche Accu-Chek Aviva BGM"
* #roche-accu-chek-aviva-expert "Accu-Chek Aviva Expert (for Roche)" "Roche Accu-Chek Aviva Expert BGM"
* #roche-accu-chek-aviva-nano "Accu-Chek Aviva Nano (for Roche)" "Roche Accu-Chek Aviva Nano BGM"
* #roche-accu-chek-aviva-plus "Accu-Chek Aviva Plus (for Roche)" "Roche Accu-Chek Aviva Plus BGM"
* #roche-accu-chek-compact-plus "Accu-Chek Compact Plus (for Roche)" "Roche Accu-Chek Compact Plus BGM"
* #roche-accu-chek-go "Accu-Chek Go (for Roche)" "Roche Accu-Chek Go BGM"
* #roche-accu-chek-nano "Accu-Chek Nano (for Roche)" "Roche Accu-Chek Nano BGM"
* #roche-accu-chek-performa "Accu-Chek Performa (for Roche)" "Roche Accu-Chek Performa BGM"
* #roche-accu-chek-performa-connect "Accu-Chek Performa Connect (for Roche)" "Roche Accu-Chek Performa Connect BGM"
* #roche-accu-chek-performa-nano "Accu-Chek Performa Nano (for Roche)" "Roche Accu-Chek Performa Nano BGM"

// LifeScan Models
* #lifescan-onetouch-ultra2 "OneTouch Ultra2 (for LifeScan)" "LifeScan OneTouch Ultra2 BGM"
* #lifescan-onetouch-ultralink "OneTouch UltraLink (for LifeScan)" "LifeScan OneTouch UltraLink BGM"
* #lifescan-onetouch-ultramini "OneTouch UltraMini (for LifeScan)" "LifeScan OneTouch UltraMini BGM"
* #lifescan-onetouch-verio "OneTouch Verio (for LifeScan)" "LifeScan OneTouch Verio BGM"
* #lifescan-onetouch-verio-flex "OneTouch Verio Flex (for LifeScan)" "LifeScan OneTouch Verio Flex BGM"
* #lifescan-onetouch-verio-iq "OneTouch Verio IQ (for LifeScan)" "LifeScan OneTouch Verio IQ BGM"
* #lifescan-onetouch-verio-sync "OneTouch Verio Sync (for LifeScan)" "LifeScan OneTouch Verio Sync BGM"
* #lifescan-onetouch-ping "OneTouch Ping (OneTouch)" "LifeScan OneTouch Ping BGM"

// Bayer Models
* #bayer-breeze-2 "Breeze 2 (for Bayer)" "Bayer Breeze 2 BGM"
* #bayer-contour "Contour (for Bayer)" "Bayer Contour BGM"
* #bayer-contour-next-usb "Contour Next USB (for Bayer)" "Bayer Contour Next USB BGM"
* #bayer-contour-usb "Contour USB (for Bayer)" "Bayer Contour USB BGM"
* #bayer-contour-xt "Contour XT (for Bayer)" "Bayer Contour XT BGM"

// Arkray Models
* #arkray-glucocard-01 "Glucocard 01 (for Arkray)" "Arkray Glucocard 01 BGM"
* #arkray-glucocard-vital "Glucocard Vital (for Arkray)" "Arkray Glucocard Vital BGM"

// Caresens Models
* #caresens-n "Caresens N (for Caresens)" "Caresens N BGM"

// Nipro/Trividia Models
* #nipro-truebalance "TrueBalance (for Nipro)" "Nipro TrueBalance BGM"
* #nipro-truemetrix-air "TrueMetrix Air (for Nipro)" "Nipro TrueMetrix Air BGM"
* #nipro-trueread "TrueRead (for Nipro)" "Nipro TrueRead BGM"
* #nipro-trueresult "TrueResult (for CVS/Nipro/Trividia/Walgreens)" "Nipro TrueResult BGM"
* #nipro-truetrack "TrueTrack (for CVS/Nipro/Trividia/Walgreens)" "Nipro TrueTrack BGM"
* #trividia-truefocus "TrueFocus (Trividia)" "Trividia TrueFocus BGM"

// Prodigy Models
* #prodigy-autocode "AutoCode (for Prodigy)" "Prodigy AutoCode BGM"
* #prodigy-voice "Voice (for Prodigy)" "Prodigy Voice BGM"
* #prodigy-pocket "Pocket (for Prodigy)" "Prodigy Pocket BGM"

// Walmart Models
* #walmart-relion-confirm "Relion Confirm (for Wal-Mart)" "Walmart Relion Confirm BGM"
* #walmart-relion-prime "Relion Prime (for Wal-Mart)" "Walmart Relion Prime BGM"

// Other/Unknown
* #99 "Other" "Other BGM model"
* #100 "Unknown" "Unknown BGM model"

ValueSet: T1DBGMModelVS
Id: t1d-bgm-model-vs
Title: "T1D BGM Model Value Set"
Description: "BGM models"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DBGMModelCS

// ============================================================================
// INSULIN PEN COMPANIES
// ============================================================================

CodeSystem: T1DInsulinPenCompanyCS
Id: t1d-insulin-pen-company-cs
Title: "T1D Insulin Pen Company Code System"
Description: "Insulin pen manufacturers from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Medtronic" "Medtronic insulin pen manufacturer"
* #2 "Bigfoot Biomedical" "Bigfoot Biomedical insulin pen manufacturer"
* #3 "Eli Lilly" "Eli Lilly insulin pen manufacturer"
* #4 "Novo Nordisk" "Novo Nordisk insulin pen manufacturer"
* #5 "Sanofi" "Sanofi insulin pen manufacturer"
* #6 "Owen Mumford" "Owen Mumford insulin pen manufacturer"
* #7 "Viatris" "Viatris insulin pen manufacturer"
* #99 "Other" "Other insulin pen manufacturer"
* #100 "Unknown" "Unknown insulin pen manufacturer"

ValueSet: T1DInsulinPenCompanyVS
Id: t1d-insulin-pen-company-vs
Title: "T1D Insulin Pen Company Value Set"
Description: "Insulin pen manufacturers"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DInsulinPenCompanyCS

// ============================================================================
// INSULIN PEN MODELS
// ============================================================================

CodeSystem: T1DInsulinPenModelCS
Id: t1d-insulin-pen-model-cs
Title: "T1D Insulin Pen Model Code System"
Description: "Insulin pen models from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Medtronic Models
* #medtronic-inpen "InPen (medtronic)" "Medtronic InPen insulin pen"

// Bigfoot Biomedical Models
* #bigfoot-white-cap "White Cap (Bigfoot Biomedical)" "Bigfoot Biomedical White Cap insulin pen"
* #bigfoot-black-cap "Black Cap (bigfoot Biomedical)" "Bigfoot Biomedical Black Cap insulin pen"

// Eli Lilly Models
* #eli-lilly-kwikpen "KwikPen (Eli Lilly)" "Eli Lilly KwikPen insulin pen"

// Novo Nordisk Models
* #novo-nordisk-flexpen "FlexPen (Novo Nordisk)" "Novo Nordisk FlexPen insulin pen"
* #novo-nordisk-flextouch "FlexTouch (Novo Nordisk)" "Novo Nordisk FlexTouch insulin pen"
* #novo-nordisk-novopen-echo "NovoPen Echo (Novo Nordisk)" "Novo Nordisk NovoPen Echo insulin pen"

// Sanofi Models
* #sanofi-solostar "SoloStar (Sanofi)" "Sanofi SoloStar insulin pen"

// Owen Mumford Models
* #owen-mumford-autopen-classic "Autopen Classic (Owen Mumford)" "Owen Mumford Autopen Classic insulin pen"

// Viatris Models
* #viatris-semglee-pen "Semglee Pen (Viatris)" "Viatris Semglee Pen insulin pen"

// Other/Unknown
* #99 "Other" "Other insulin pen model"
* #100 "Unknown" "Unknown insulin pen model"

ValueSet: T1DInsulinPenModelVS
Id: t1d-insulin-pen-model-vs
Title: "T1D Insulin Pen Model Value Set"
Description: "Insulin pen models"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DInsulinPenModelCS

// ============================================================================
// DEVICE USAGE METHOD CODES
// ============================================================================

CodeSystem: T1DDeviceUsageMethodCS
Id: t1d-device-usage-method-cs
Title: "T1D Device Usage Method Code System"
Description: "Device usage reporting methods from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Download" "Device data obtained via download"
* #2 "Self-report" "Device data obtained via patient self-report"
* #3 "Download and self-report" "Device data obtained via combination of download and self-report"
* #10 "Unknown" "Unknown device data reporting method"

ValueSet: T1DDeviceUsageMethodVS
Id: t1d-device-usage-method-vs
Title: "T1D Device Usage Method Value Set"
Description: "Device usage reporting methods"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DDeviceUsageMethodCS

// ============================================================================
// INSULIN REGIMEN CODES
// ============================================================================

CodeSystem: T1DInsulinRegimenCS
Id: t1d-insulin-regimen-cs
Title: "T1D Insulin Regimen Code System"
Description: "Insulin regimen types from T1D Exchange specifications"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #1 "Insulin pump" "Insulin pump therapy including hybrid pump/injection regimens"
* #2 "Injection, basal-bolus" "Injection regimen using carbohydrate ratios primarily for prandial insulin"
* #3 "Injection, mixed/split" "Regimen using intermediate acting insulin with adjustments for variable carbohydrate intake"
* #4 "Injection, sliding scale" "Regimen using fixed prandial doses with adjustments for variable glucose levels"
* #5 "Injection, fixed dose" "Constant insulin doses independent of carbohydrate intake and glucose values"
* #9 "Injection, unknown dose method" "Injections are used but the dose method is unknown"
* #99 "Other regimen" "Other insulin regimen type"
* #100 "Unknown" "Unknown if pump or injection"

ValueSet: T1DInsulinRegimenVS
Id: t1d-insulin-regimen-vs
Title: "T1D Insulin Regimen Value Set"
Description: "Insulin regimen types"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* include codes from system T1DInsulinRegimenCS