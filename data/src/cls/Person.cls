// Purpose: This class stores information about traders. The Hibernate.Trade refers to this class for the detail of trader. 

Class Demo.Person Extends %Persistent
{

Property FirstName As %String;

Property LastName As %String;

Property Phonenumber As %String;

Property Trades As array Of Hibernate.Trade [ SqlFieldName = Trade ];

}
