// T1D Exchange Device Profiles
// Device Integration: Insulin pumps, CGMs, BGMs, and insulin pens

// ============================================================================
// DEVICE BASE PROFILE
// ============================================================================

Profile: T1DDevice
Parent: Device
Id: t1d-device
Title: "T1D Exchange Device"
Description: "Base device profile for T1D Exchange with manufacturer and model tracking"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^publisher = "T1D Exchange"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://t1dexchange.org"

* identifier 1..* MS
* identifier ^short = "T1D Exchange device identifier"
* identifier ^definition = "Unique device identifier for T1D Exchange tracking"

* manufacturer 1..1 MS
* manufacturer ^short = "Device manufacturer"
* manufacturer ^definition = "Manufacturer of the T1D device (pump, CGM, BGM, pen)"

* deviceName 1..1 MS
* deviceName.name 1..1 MS
* deviceName.name ^short = "Device model name"
* deviceName.name ^definition = "Specific model name of the T1D device"

* type 1..1 MS
* type from T1DDeviceTypeVS (required)
* type ^short = "Type of T1D device"
* type ^definition = "Category of T1D device: insulin pump, CGM, BGM, or insulin pen"

* patient 1..1 MS
* patient only Reference(T1DPatient)
* patient ^short = "Patient using this device"
* patient ^definition = "Reference to the T1D patient using this device"

// ============================================================================
// INSULIN PUMP DEVICE PROFILE
// ============================================================================

Profile: T1DInsulinPumpDevice
Parent: T1DDevice
Id: t1d-insulin-pump-device
Title: "T1D Exchange Insulin Pump Device"
Description: "Insulin pump device profile with delivery system and start date tracking"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* type = T1DDeviceTypeCS#insulin-pump
* manufacturer from T1DInsulinPumpCompanyVS (required)
* deviceName.name from T1DInsulinPumpModelVS (required)

* extension contains
    T1DPumpStartDate named pumpStartDate 0..1 MS and
    T1DPumpDeliverySystem named deliverySystem 0..1 MS and
    T1DPumpSiteChangeFreq named siteChangeFreq 0..1 MS

* extension[pumpStartDate] ^short = "Insulin pump start date"
* extension[pumpStartDate] ^definition = "Date when patient started using insulin pump (pump_st_dt)"

* extension[deliverySystem] ^short = "Pump delivery system type"
* extension[deliverySystem] ^definition = "Type of insulin pump delivery system (ins_pump_delivery)"

* extension[siteChangeFreq] ^short = "Site change frequency"
* extension[siteChangeFreq] ^definition = "Frequency of insulin pump site changes in days (ins_pump_site_freq)"

// ============================================================================
// CGM DEVICE PROFILE
// ============================================================================

Profile: T1DCGMDevice
Parent: T1DDevice
Id: t1d-cgm-device
Title: "T1D Exchange CGM Device"
Description: "Continuous glucose monitor device profile with usage tracking"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* type = T1DDeviceTypeCS#cgm
* manufacturer from T1DCGMCompanyVS (required)
* deviceName.name from T1DCGMModelVS (required)

* extension contains
    T1DCGMStartDate named cgmStartDate 0..1 MS

* extension[cgmStartDate] ^short = "CGM start date"
* extension[cgmStartDate] ^definition = "Date when patient started using CGM (cgm_st_dt)"

// ============================================================================
// BGM DEVICE PROFILE
// ============================================================================

Profile: T1DBGMDevice
Parent: T1DDevice
Id: t1d-bgm-device
Title: "T1D Exchange BGM Device"
Description: "Blood glucose meter device profile"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* type = T1DDeviceTypeCS#bgm
* manufacturer from T1DBGMCompanyVS (required)
* deviceName.name from T1DBGMModelVS (required)

// ============================================================================
// INSULIN PEN DEVICE PROFILE
// ============================================================================

Profile: T1DInsulinPenDevice
Parent: T1DDevice
Id: t1d-insulin-pen-device
Title: "T1D Exchange Insulin Pen Device"
Description: "Insulin pen device profile"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true

* type = T1DDeviceTypeCS#insulin-pen
* manufacturer from T1DInsulinPenCompanyVS (required)
* deviceName.name from T1DInsulinPenModelVS (required)

// ============================================================================
// DEVICE EXTENSIONS
// ============================================================================

Extension: T1DPumpStartDate
Id: t1d-pump-start-date
Title: "T1D Pump Start Date"
Description: "Date when patient started using insulin pump"
* ^version = "0.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Device"
* value[x] only date
* valueDate 1..1
* valueDate ^short = "Pump start date"
* valueDate ^definition = "Date of insulin pump start (YYYYMMDD, YYYYMM format)"

Extension: T1DPumpDeliverySystem
Id: t1d-pump-delivery-system
Title: "T1D Pump Delivery System"
Description: "Type of insulin pump delivery system"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^context.type = #element
* ^context.expression = "Device"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from T1DPumpDeliverySystemVS (required)
* valueCodeableConcept ^short = "Delivery system type"
* valueCodeableConcept ^definition = "Insulin pump delivery system: open loop, hybrid closed loop, etc."

Extension: T1DPumpSiteChangeFreq
Id: t1d-pump-site-change-freq
Title: "T1D Pump Site Change Frequency"
Description: "Frequency of insulin pump site changes in days"
* ^version = "0.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Device"
* value[x] only integer
* valueInteger 1..1
* valueInteger ^short = "Site change frequency (days)"
* valueInteger ^definition = "Typical interval in days between insulin pump site changes"

Extension: T1DCGMStartDate
Id: t1d-cgm-start-date
Title: "T1D CGM Start Date"
Description: "Date when patient started using CGM"
* ^version = "0.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Device"
* value[x] only date
* valueDate 1..1
* valueDate ^short = "CGM start date"
* valueDate ^definition = "Date of CGM start (YYYYMMDD, YYYYMM, YYYY format)"