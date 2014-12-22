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


// This is your card
var card = Card()


// Set the color of your card
card.backgroundColor = lightYellow

// Set the greeting of your card
card.greetingText = "Happy Holidays!"

// Pick a font for your greeting
card.greetingFont = satisfy

// Set the message of your card
card.messageText = "From Everyone!"

// Pick a font for your message
card.messageFont = handlee

// Add pictures to your card
card.addClipArtImage(dradle)
card.addClipArtImage(garland)
card.addClipArtImage(holly)
card.addClipArtImage(menorah)
card.addClipArtImage(present)
card.addClipArtImage(snowman)
card.addClipArtImage(snowflake1)
card.addClipArtImage(snowflake2)
card.addClipArtImage(star)
card.addClipArtImage(christmasTree)


// Move your pictures where you want them
//card.moveClipArtImageDown(menorah)
//card.moveClipArtImageRight(snowflake1)
//card.moveClipArtImageUp(star)
//card.moveClipArtImageRight(star)
//card.moveClipArtImageRight(star)
//card.moveClipArtImageLeft(christmasTree)


// Print your card!
printCard(card)

// Use this to find your printed card in the Finder
printDocumentsDirectory()






















