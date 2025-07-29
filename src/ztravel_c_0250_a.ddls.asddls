@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Consumotion Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZTRAVEL_c_0250_A
  provider contract transactional_query
  as projection on ZTRAVEL_r_0250_A
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      TravelID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Agency_StdVH',
                                                    element: 'AgencyID' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      AgencyID,
      _Agency.Name                                                      as AgencyName, //Agrega el nombre de la agencia a la ayuda de busqueda

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer_StdVH',
                                                    element: 'CustomerID' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      CustomerID,
      _Customer.LastName                                                as CustomerName,

      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH',
                                                    element: 'Currency' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      CurrencyCode,

      Description,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'OverallStatusText']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH',
                                                    element: 'OverallStatus' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      OverallStatus,
      _OverallStatus._Text[1: Language = $session.system_language].Text as OverallStatusText, //Se agrega [1: Language = $session.system_language] para que traiga unicamente el idioma en que se logueo el usuario
                                                                                              //o Se agrega localized
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZBOOKING_C_0250_A,
      _Currency,
      _Customer,
      _OverallStatus
}
