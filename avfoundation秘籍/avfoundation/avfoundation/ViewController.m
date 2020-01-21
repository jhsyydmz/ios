//
//  ViewController.m
//  avfoundation
//
//  Created by cyl on 2020/1/20.
//  Copyright © 2020 cyl. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property(strong,nonatomic) AVSpeechSynthesizer *syn;
@property(strong,nonatomic) NSArray *voices;
@property(strong,nonatomic) NSArray *speechStrings;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.redColor;
    
    //读音
//    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
//    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:@"Hello World!"];
//    [synthesizer speakUtterance:utterance];

//    [self creatVoice];
//    [self beginConversation];

}

- (void)creatVoice{
    _syn = [[AVSpeechSynthesizer alloc]init];
    _voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],
                [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"]];
    _speechStrings = [self buildSpeechStrings];
}

- (NSArray *)buildSpeechStrings{
    return @[@"Hello AV Foundation. How are you?",
             @"I'm well! Thanks for asking.",
             @"Are you excited about the book?",
             @"Very! I have always felt so misunderstood",
             @"What's your favorite feature?",
             @"Oh, they're all my babies, I couldn't possibley choose.",
             @"It was great to speek with you!",
             @"The pleasure was all mine! Have fun!"];
}
- (void)beginConversation{
    for (NSUInteger i = 0; i<self.speechStrings.count; i++) {
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i%2];
        utterance.rate = 0.4f;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.syn speakUtterance:utterance];
    }
    
}
@end
