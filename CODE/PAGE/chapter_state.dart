// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/calendar_spacing.dart";
import "../DATA/course.dart";
import "../DATA/date.dart";
import "../DATA/planning.dart";
import "../DATA/status.dart";
import "chapter_page.dart";

// -- TYPES

class CHAPTER_STATE extends State<CHAPTER_PAGE>
{
    // -- ATTRIBUTES

    TextEditingController
        NameTextEditingController;

    // -- CONSTRUCTORS

    CHAPTER_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    void initState(
        )
    {
        super.initState();

        NameTextEditingController = TextEditingController( text: widget.Chapter.Name );
    }

    // ~~

    Widget GetNameWidget(
        )
    {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: TextField(
                        maxLines: null,
                        decoration: widget.Data.GetInputDecoration(),
                        controller: NameTextEditingController,
                        onChanged:
                            ( String text )
                            {
                                widget.Chapter.Name = text;
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetStatusWidget(
        )
    {
        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<STATUS>(
                            value: widget.Chapter.Status,
                            isExpanded: true,
                            items: <DropdownMenuItem<STATUS>>[
                                DropdownMenuItem<STATUS>(
                                    value: STATUS.Active,
                                    child: widget.Data.GetPaddedColoredButton(
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    child: widget.Data.GetMediumText(
                                                        widget.Data.GetText( "Active (chapter)" )
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ),
                                DropdownMenuItem<STATUS>(
                                    value: STATUS.Inactive,
                                    child: widget.Data.GetPaddedColoredButton(
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    child: widget.Data.GetMediumText(
                                                        widget.Data.GetText( "Inactive (chapter)" )
                                                        )
                                                )
                                                ]
                                            )
                                        )
                                    )
                                ],
                            onChanged:
                                ( STATUS status )
                                {
                                    setState(
                                        ()
                                        {
                                            if ( status != null )
                                            {
                                                widget.Chapter.Status = status;
                                            }
                                        }
                                        );
                                }
                            )
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetCourseWidget(
        )
    {
        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<COURSE>(
                            value: widget.Course,
                            isExpanded: true,
                            items: widget.Data.CourseList.map<DropdownMenuItem<COURSE>>(
                                ( COURSE course )
                                {
                                    return DropdownMenuItem<COURSE>(
                                        value: course,
                                        child: widget.Data.GetPaddedColoredButton(
                                            Row(
                                                children: <Widget>[
                                                    Expanded(
                                                        child: widget.Data.GetMediumText(
                                                            widget.Data.GetCourseName( course )
                                                            )
                                                        )
                                                    ]
                                                )
                                            )
                                        );
                                }
                                ).toList(),
                            onChanged:
                                ( COURSE course )
                                {
                                    setState(
                                        ()
                                        {
                                            if ( course != null
                                                && !identical( course, widget.Course ) )
                                            {
                                                widget.Data.ChangeCourse(
                                                    widget.Chapter,
                                                    widget.Course,
                                                    course
                                                    );

                                                widget.Course = course;
                                            }
                                        }
                                        );
                                }
                            )
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetPlanningWidget(
        )
    {
        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<PLANNING>(
                            value: widget.Chapter.Planning,
                            isExpanded: true,
                            items: widget.Data.PlanningList.map<DropdownMenuItem<PLANNING>>(
                                ( PLANNING planning )
                                {
                                    return DropdownMenuItem<PLANNING>(
                                        value: planning,
                                        child: widget.Data.GetPaddedColoredButton(
                                            Row(
                                                children: <Widget>[
                                                    Expanded(
                                                        child: widget.Data.GetMediumText(
                                                            widget.Data.GetPlanningName( planning )
                                                            )
                                                        )
                                                    ]
                                                )
                                            )
                                        );
                                }
                                ).toList(),
                            onChanged:
                                ( PLANNING planning )
                                {
                                    setState(
                                        ()
                                        {
                                            if ( planning != null )
                                            {
                                                widget.Chapter.Planning = planning;
                                            }
                                        }
                                        );
                                }
                            )
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetDateWidget(
        BuildContext build_context
        )
    {
        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            widget.Data.GetMediumText(
                                widget.Data.Language.GetDate( widget.Chapter.Date )
                                )
                            ),
                        onTap:
                            ()
                            {
                                showDatePicker(
                                    context: build_context,
                                    initialDate: widget.Chapter.Date.GetDateTime(),
                                    firstDate: DateTime( widget.Chapter.Date.Year - 5, 1 ),
                                    lastDate: DateTime( widget.Chapter.Date.Year + 5, 12 )
                                    ).then(
                                        ( DateTime date_time )
                                        {
                                            if ( date_time != null )
                                            {
                                                setState(
                                                    ()
                                                    {
                                                        widget.Chapter.Date = DATE.FromDateTime( date_time );
                                                    }
                                                    );
                                            }
                                        }
                                        );
                            }
                        )
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.remove )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Chapter.Date = widget.Chapter.Date.GetSum( -1 );
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.add )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Chapter.Date = widget.Chapter.Date.GetSum( 1 );
                                }
                                );
                        }
                    )
                ]
            );
    }

    // ~~

    Widget GetRepetitionCountWidget(
        )
    {
        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: widget.Data.GetPaddedColoredButton(
                        widget.Data.GetMediumText(
                            widget.Chapter.RepetitionCount.toString()
                            )
                        )
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.remove )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    if ( widget.Chapter.RepetitionCount > 0 )
                                    {
                                        --widget.Chapter.RepetitionCount;
                                    }
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.add )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    ++widget.Chapter.RepetitionCount;
                                }
                                );
                        }
                    )
                ]
            );
    }

    // ~~

    Widget GetPriorDateWidget(
        )
    {
        DATE
            prior_date;

        prior_date = widget.Chapter.GetPriorDate();

        return Row(
            children: <Widget>[
                SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: widget.Data.GetPaddedColoredButton(
                        widget.Data.GetMediumText(
                            widget.Data.Language.GetDate( prior_date )
                            )
                        )
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.remove )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    --widget.Chapter.OffsetDayCount;
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.add )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    ++widget.Chapter.OffsetDayCount;
                                }
                                );
                        }
                    )
                ]
            );
    }

    // ~~

    Widget GetNextDateWidget(
        )
    {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.Chapter.GetNextSpacingList( 6 ).map<Widget>(
                ( CALENDAR_SPACING calendar_spacing )
                {
                    return Column(
                        children: <Widget>[
                            Row(
                                children: <Widget>[
                                    SizedBox(
                                        width: 15.0
                                        ),
                                    Expanded(
                                        child: widget.Data.GetPaddedButton(
                                            widget.Data.GetMediumText(
                                                widget.Data.Language.GetDate( calendar_spacing.Date )
                                                )
                                            )
                                        )
                                    ]
                                )
                            ]
                        );
                }
                ).toList()
            );
    }

    // ~~

    Widget build(
        BuildContext build_context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "CHAPTER" )
                    )
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Name:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetNameWidget(),
                                SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Status:" )
                                    ),
                                GetStatusWidget(),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Course:" )
                                    ),
                                GetCourseWidget(),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Planning:" )
                                    ),
                                GetPlanningWidget(),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Date:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetDateWidget( build_context ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Number of repetitions:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetRepetitionCountWidget(),
                                SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Last date:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetPriorDateWidget(),
                                SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Next dates:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetNextDateWidget()
                                ]
                            )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
