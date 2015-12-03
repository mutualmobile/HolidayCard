// Playground - noun: a place where people can play

import UIKit
import CardBuilder


// Color Options
let blueSky = Color.BlueSky
let hollyGreen = Color.HollyGreen
let lightBlue = Color.LightBlue
let lightGreen = Color.LightGreen
let lightOrange = Color.LightOrange
let lightRed = Color.LightRed
let lightYellow = Color.LightYellow
let snowWhite = Color.SnowWhite


// Font Options
let abrilFatFace = Font.AbrilFatFace
let handlee = Font.Handlee
let markerFelt = Font.MarkerFelt
let pacifico = Font.Pacifico
let satisfy = Font.Satisfy
let savoye = Font.Savoye
let zapfino = Font.Zapfino


// Clip Art Options
let dradle = ClipArt.Dradle
let garland = ClipArt.Garland
let holly = ClipArt.Holly
let menorah = ClipArt.Menorah
let present = ClipArt.Present
let snowflake1 = ClipArt.Snowflake1
let snowflake2 = ClipArt.Snowflake2
let snowman = ClipArt.Snowman
let star = ClipArt.Star
let christmasTree = ClipArt.Tree


// Create your card
var card = Card()



card.backgroundColor = blueSky
card.addClipArtImage(snowflake1)
card.addClipArtImage(dradle)
card.addGreetingText("Happy Holidays!")
card.changeGreetingFont(abrilFatFace)
card.changeGreetingFont(zapfino)
card.moveClipArtImageDown(dradle)


// Print your card!
printCard(card)






















