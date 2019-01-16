class TQLanguage
{
    var _Node;
    function TQLanguage()
    {
    } // End of the function
    function GetText(AId)
    {
        for (var _loc2 = 0; _Node.childNodes[_loc2]; ++_loc2)
        {
            for (var _loc5 = 0; _Node.childNodes[_loc2].childNodes[_loc5]; ++_loc5)
            {
                if (_Node.childNodes[_loc2].childNodes[_loc5].attributes.id == AId)
                {
                    if (_Node.childNodes[_loc2].childNodes[_loc5].childNodes[0] == undefined)
                    {
                        return ("");
                        continue;
                    } // end if
                    var _loc3 = new String();
                    _loc3 = String(_Node.childNodes[_loc2].childNodes[_loc5].childNodes[0]);
                    var _loc4 = ["&amp;", "&", "&lt;", "<", "&gt;", ">", "&apos;", "\'", "&quot;", "\"", "&sup2;", "² ", "&sup3;", "³ ", "&trade;", "T"];
                    for (var _loc2 = 0; _loc2 < _loc4.length; _loc2 = _loc2 + 2)
                    {
                        _loc3 = _loc3.split(_loc4[_loc2]).join(_loc4[_loc2 + 1]);
                    } // end of for
                    return (_loc3);
                } // end if
            } // end of for
        } // end of for
        return ("");
    } // End of the function
    function LoadFromXML(ANode)
    {
        _Node = ANode;
        return;
    } // End of the function
} // End of Class
