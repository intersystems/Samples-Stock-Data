// PURPOSE: This class stores information about stocks. It also contains the function to load one year of stock data. 

Class Demo.Stock Extends %Persistent
{

Property TransDate As %Date;

Index TDX On TransDate;

Property StockOpen As %Numeric(SCALE = 4);

Property High As %Numeric(SCALE = 4);

Property Low As %Numeric(SCALE = 4);

Property StockClose As %Numeric(SCALE = 4);

Property Volume As %Integer;

Property Name As %String;

Index NameX On Name [ Type = bitmap ];

ClassMethod LoadData(FileLocation As %String = "/tmp/irisupdate/all_stocks_1yr.csv") As %String
{
		set status = $$$OK
		
		try {
			set stream = ##class(%Stream.FileCharacter).%New()
			set sc = stream.LinkToFile(FileLocation)
			set line = stream.ReadLine() //don't use headers for anything
			while 'stream.AtEnd {
				set line = stream.ReadLine()
				set stock = ##class(Demo.Stock).%New()
				set stock.TransDate = $zdateh($piece(line,",",1))
				set stock.StockOpen = $piece(line,",",2)
				set stock.High = $piece(line,",",3)
				set stock.Low = $piece(line,",",4)
				set stock.StockClose = $piece(line,",",5)
				set stock.Volume = $piece(line,",",6) 
				set stock.Name = $zstrip($piece(line,",",7),"*C")
				set status = stock.%Save()
			}
		} catch sc {
			write "In Catch block",!
    		write "error code: ",sc.Code,!
    		write "error location: ",sc.Location,!
    		write "error data:",$LISTGET(sc.Data,2),!	
		}
		quit status
}

}
