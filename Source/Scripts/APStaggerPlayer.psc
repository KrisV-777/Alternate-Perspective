Scriptname APStaggerPlayer extends ActiveMagicEffect

Spell Property staggerMe Auto
ImageSpaceModifier Property CGDragonAttackBlurLong Auto

; this script is called when Alduin shouts the first time, we apply our ImageSpace here to give first signs of the Player getting knocked out
Event OnEffectStart(Actor akTarget, Actor akCaster)
  CGDragonAttackBlurLong.Apply()
  staggerMe.Cast(Game.GetPlayer())
EndEvent
