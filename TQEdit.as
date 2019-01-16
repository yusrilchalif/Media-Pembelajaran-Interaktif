class TQEdit extends TQBase
{
    var answers, AnswersNumber;
    function TQEdit(atype)
    {
        super(atype);
    } // End of the function
    function AddAnswer(ANode)
    {
        var _loc3;
        _loc3 = _global.RemoveCR(String(ANode.childNodes[0]).toLowerCase());
        answers.push(_loc3);
    } // End of the function
    function GetResponse(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex]);
        }
        else
        {
            return ("");
        } // end else if
    } // End of the function
    function SetResponse(AResponse)
    {
        answer = String(AResponse).toLowerCase();
    } // End of the function
    function UserResponse()
    {
        var _loc2;
        var _loc3 = answers.length;
        if (_loc3 <= 0)
        {
            return (false);
        }
        else
        {
            for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
            {
                if (answers[_loc2] == answer)
                {
                    return (true);
                } // end if
            } // end of for
            return (false);
        } // end else if
    } // End of the function
    function IsAnswered()
    {
        if (answer == "")
        {
            return (false);
        }
        else
        {
            return (true);
        } // end else if
    } // End of the function
    function GetResponseAsString()
    {
        var _loc2;
        _loc2 = answer;
        return (_loc2);
    } // End of the function
    function GetResponseAsStringLMS()
    {
        var _loc2;
        _loc2 = this.GetResponseAsString();
        return (_loc2);
    } // End of the function
    function GetCorrectResponseAsString()
    {
        var _loc4;
        _loc4 = "";
        var _loc3;
        var _loc5 = answers.length;
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
            {
                _loc4 = _loc4 + answers[_loc3];
                if (_loc3 < _loc5 - 1)
                {
                    _loc4 = _loc4 + _global.response_separator;
                } // end if
            } // end of for
        } // end else if
        return (_loc4);
    } // End of the function
    function GetCorrectResponseAsStringLMS()
    {
        var _loc2;
        _loc2 = this.GetCorrectResponseAsString();
        return (_loc2);
    } // End of the function
    function XMLAddAnswers(my_xml, node_answers)
    {
        var _loc2 = my_xml.createElement("userresponse");
        var _loc3 = my_xml.createTextNode(answer);
        _loc2.appendChild(_loc3);
        node_answers.parentNode.appendChild(_loc2);
        return (true);
    } // End of the function
    var answer = "";
} // End of Class
