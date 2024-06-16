/*
 * Copyright (C) 2024  Schmuel Odradek
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * ut-notchfix is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'ut-notchfix.schmuel'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    PageStack {
        id: pageStack
        Component.onCompleted: push (page0)


        Page {
            id: page0
            anchors.fill: parent
            visible: false

            header: PageHeader {
                id: header
                title: i18n.tr("Notchfix")
            }

            Column{
                y: header.height+units.gu(2)
                height: parent.height-header.height-units.gu(2)
                width: parent.width
                spacing: units.gu(1)

                Label{
                    x: parent.x + units.gu(2)
                    text: i18n.tr("left margin")
                }
                TextField{
                    id: leftmargin
                    x: parent.x + units.gu(2)
                    validator: IntValidator {bottom: 0; top: 31.0;}
                }

                Item{
                    width: 1
                    height: units.gu(1)
                }

                Label{
                    anchors.top: leftmargin.bottom + units.gu(2)
                    x: parent.x + units.gu(2)
                    text: i18n.tr("right margin")
                }
                TextField{
                    id: rightmargin
                    x: parent.x + units.gu(2)
                    validator: IntValidator {bottom: 0; top: 31.0;}
                }

                Item{
                    width: 1
                    height: units.gu(1)
                }

                Label{
                    anchors.top: leftmargin.bottom + units.gu(2)
                    x: parent.x + units.gu(2)
                    text: i18n.tr("minimized panel height")
                }
                TextField{
                    id: minpanheight
                    x: parent.x + units.gu(2)
                    validator: IntValidator {bottom: 0; top: 31.0;}
                }

                Item{
                    width: 1
                    height: units.gu(1)
                }

                Label{
                    anchors.top: leftmargin.bottom + units.gu(2)
                    x: parent.x + units.gu(2)
                    text: i18n.tr("expanded panel height")
                }
                TextField{
                    id: exppanheight
                    x: parent.x + units.gu(2)
                    validator: IntValidator {bottom: 0; top: 31.0;}
                }
            }

            Button {
                width:page0.width * 0.3
                x:page0.width*0.1
                y:page0.height*0.9
                text: i18n.tr("Select presets")
                onClicked: pageStack.push(presets)
            }
            Button {
                width:page0.width * 0.3
                y:page0.height*0.9
                x:page0.width-width-page0.width*0.1
                text: i18n.tr("Apply")
                onClicked: print ("Apply")
            }
        }

        Page {
            id: presets
            anchors.fill: parent
            visible: false

            header: PageHeader{
                id: headerpres
                title: i18n.tr("Notchfix > Presets")
            }

            ScrollView{
                id: scrollView

                y: headerpres.height + units.gu(2)
                width: parent.width
                height: presets.height-headerpres.height

                clip: true

                Column {
                    id: presetColumn
                    spacing: units.gu(2)
                    width: scrollView.width
                

                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Volla Phone")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Volla Phone X")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Volla Phone 22")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Volla Phone X23")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Fairphone 4")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("OnePlus 6/6T")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Xiaomi Mi Mix 3")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Xiaomi Poco F1")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Xiaomi Redmi Note 7")
                        onClicked: print ("Apply")
                    }
                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Xiaomi Redmi Note 9S")
                        onClicked: print ("Apply")
                    }

                    Button {
                        width: presets.width * 0.6
                        x: parent.width/2-width/2
                        text: i18n.tr("Reset")
                        onClicked: print ("Apply")
                    }
                }
            }
        }
    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));

            importModule('example', function() {
                console.log('module imported');
                python.call('example.speak', ['Hello World!'], function(returnValue) {
                    console.log('example.speak returned ' + returnValue);
                })
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
