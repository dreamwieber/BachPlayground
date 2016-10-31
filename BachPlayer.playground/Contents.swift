//  Bach MIDI File from http://www.jsbach.net/midi/midi_goldbergvariations.html

import AVFoundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let midiFile = Bundle.main.url(forResource: "bach", withExtension: "mid")!
var midiPlayer: AVMIDIPlayer?

do {
    try midiPlayer = AVMIDIPlayer(contentsOf: midiFile, soundBankURL: nil)
    midiPlayer?.prepareToPlay()
} catch {
    print("could not create MIDI player")
}

midiPlayer?.play {
    print("finished playing")
}

//midiPlayer?.stop()
