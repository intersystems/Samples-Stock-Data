// PURPOSE: This class stores information about stocks used for connecting to InterSystems with Java Hibernate. 

Class Hibernate.Trade Extends %Library.Persistent
{

Property stockName As %Library.String(MAXLEN = 10000);

Property purchaseDate As %Library.Date;

Property purchasePrice As %Library.Decimal;

Property shares As %Library.Integer;

Property trader As Demo.Person;

ForeignKey traderKey(trader) References Demo.Person() [ OnDelete = cascade ];

}
