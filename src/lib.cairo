// use debug::PrintTrait;
// fn main(){
//     // Accessing Fixed Array
//     // Deconstructing the Array in variables
//     let my_Array = [1,2,3,4,5];
//     let [_a,_b,c,_,_] = my_Array;
//     'c: '.print();
//      c.print();
//      span();
//      flow();
// }

// Converting the Array into a span for indexing
// fn main(){
//     let my_Array = [1,2,3,4,4];
//     let my_span = my_Array.span();
//     print!("my_span[2]: {}", my_span[2]);
    
// }



fn main(){
let my_large_u16:u16 = 204;
let my_large_u8:u8 = my_large_u16.try_into().unwrap();
print!("The value is: {}", my_large_u8);

}

// Cairo uses an immutable memory model, meaning that once a memory cell is written to, it can't be overwritten but only read from. To reflect this immutable memory model, variables in Cairo are immutable by default. However, the language abstracts this model and gives you the option to make your variables mutable. Let’s explore how and why Cairo enforces immutability, and how you can make your variables mutable.

//When a variable is immutable, once a value is bound to a name, you can’t change that value. To illustrate this, generate a new project called variables in your cairo_projects directory by using scarb new variables
// for example
fn var(){
    let x = 5;
    println!("the value of x is:{}", x);
    x = 6;
    println!("the value of x is:{}", x); // this will receive an error message : Cannot assign to an immutable variable.
}

fn correct_var(){
    let mut x = 5;
    println!("the value of x is: {}", x);
    x = 6;
    println!("the value of x is {}", x); // this is now correct when we compile we'll get The value of x is: 5
    // The value of x is: 6
    // Run completed successfully, returning []
    // We’re allowed to change the value bound to x from 5 to 6 when mut is used. Ultimately, deciding whether to use mutability or not is up to you and depends on what you think is clearest in that particular situation.
}

// constants
// Like Immutable variables, constant are values that are bound to a name and you're not allowed to change, but there a different between constants and variables

// first you aren't allowed to use mut with constant, Constant aren't just immutable by defaults they're always immutable. You declare constants using the const keyword instead of the let keyword, and the type of the value must be annotated.

// Constant variables can be declared with any usual data type, including structs, enums and fixed-size arrays.

// Constants can only be declared in the global scope, which makes them useful for values that many parts of code need to know about.

// The last difference is that constants may natively be set only to a constant expression, not the result of a value that could only be computed at runtime.

// Example:
struct AnyStruct {
    a: u256,
    b: u32,
}

enum AnyEnum {
    A: felt252,
    B: (usize, u256),
}

const ONE_HOUR_IN_SECONDS: u32 = 3600;
const STRUCT_INSTANCE: AnyStruct = AnyStruct { a: 0, b: 1 };
const ENUM_INSTANCE: AnyEnum = AnyEnum::A('any enum');
const BOOL_FIXED_SIZE_ARRAY: [bool; 2] = [true, false];
