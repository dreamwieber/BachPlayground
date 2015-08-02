//  Bach MIDI File from http://www.jsbach.net/midi/midi_goldbergvariations.html

import UIKit
import AVFoundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(true)

let audioEngine = AVAudioEngine()
let mixer = audioEngine.mainMixerNode

// Sampler not actually used to play MIDI,
// but AVAudioEngine needs at least one input
let sampler: AVAudioUnitSampler = AVAudioUnitSampler()

audioEngine.attachNode(sampler)
audioEngine.connect(sampler, to: mixer, format: nil)

let midiFile = NSBundle.mainBundle().URLForResource("bach", withExtension: "mid")!
var midiPlayer: AVMIDIPlayer?

do {
    try midiPlayer = AVMIDIPlayer(contentsOfURL: midiFile, soundBankURL: nil)
    midiPlayer?.prepareToPlay()
} catch {
    print("could not create MIDI player")
}

do {
    try audioEngine.start()
    midiPlayer?.play {
        print("finished playing")
    }
} catch {
    print("could not start audio engine")
}

midiPlayer?.stop()
