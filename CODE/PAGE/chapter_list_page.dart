// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "chapter_list_state.dart";

// -- TYPES

class CHAPTER_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    CHAPTER_LIST_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        super()
    {
        ApplicationState = application_state;
        Data = data;
    }

    // -- OPERATIONS

    CHAPTER_LIST_STATE createState(
        )
    {
        return CHAPTER_LIST_STATE();
    }
}
