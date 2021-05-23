#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

    //MARK: first string
    NSMutableArray *firstArray = [[NSMutableArray alloc] init];
    NSUInteger length = string1.length;
    unichar buffer[length+1];

    [string1 getCharacters:buffer range:NSMakeRange(0, length)];

    // перебираем и кидаем в array
    for (int i = 0; i < length; i++) {
        char current = buffer[i];
        NSString *currentNumber = [[NSString alloc] initWithFormat:@"%c", current];
        [firstArray addObject:currentNumber];
    }

    //MARK: second string
    NSMutableArray *secondArray = [[NSMutableArray alloc] init];
    NSUInteger secondLength = string2.length;
    unichar secondBuffer[secondLength+1];

    [string2 getCharacters:secondBuffer range:NSMakeRange(0, secondLength)];

    // перебираем и кидаем в array
    for (int i = 0; i < secondLength; i++) {
        char secondCurrent = secondBuffer[i];
        NSString *currentNumber = [[NSString alloc] initWithFormat:@"%c", secondCurrent];
        [secondArray addObject:currentNumber];
    }

    NSMutableString *answer = [[NSMutableString alloc] init];

    for (int i = 0; i < (string1.length < string2.length ? string1.length : string2.length); i++) {

        // проверка что в одном из массив пусто
        if ((!firstArray || !firstArray.count) || (!secondArray || !secondArray.count)) {

            // определяем где именно не хватает
            if (!firstArray || !firstArray.count) {
                for (int k = 0; k < secondArray.count; k++) {
                    [answer appendString:secondArray[k]];
                }
                break;
            }
            if (!secondArray || !secondArray.count) {
                for (int k = 0; k < firstArray.count; k++) {
                    [answer appendString:firstArray[k]];
                }
                break;
            }
        }

        NSComparisonResult result = [firstArray[i] compare: secondArray[i]];

        if (result == NSOrderedAscending) {
            [answer appendString:firstArray[i]];
            NSLog(@"append %@", firstArray[i]);
            
            [firstArray removeObjectAtIndex:i];

            i -= 1;
        }

        if (result == NSOrderedDescending) {
            [answer appendString:secondArray[i]];
            NSLog(@"append %@", secondArray[i]);

            [secondArray removeObjectAtIndex:i];

            i -= 1;
        }

        if (result == NSOrderedSame) {
            [answer appendString:firstArray[i]];
            NSLog(@"append %@", firstArray[i]);

//            //MARK: химичим
//            if (firstArray.count >= 2) {
//                NSComparisonResult result = [firstArray[i] compare: firstArray[i+1]];
//                if (result == NSOrderedDescending) {
//                    [firstArray addObject:firstArray[i]];
//                    [firstArray removeObjectAtIndex:i];
//                }
//            }

            [firstArray removeObjectAtIndex:i];

            // как вариант
//            [secondArray removeObjectAtIndex:i];

            i -= 1;
        }
    }
    
    return [answer copy];
}

@end
