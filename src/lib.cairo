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

//Nonetheless, it is possible to use the consteval_int! macro to create a const variable that is the result of some computation:
const ONE_HOUR_IN_SECONDS: u32 = consteval_int!(60 * 60);

// Cairo's naming convention for constants is to use all uppercase with underscores between words.

// Constants are valid for the entire time a program runs, within the scope in which they were declared. This property makes constants useful for values in your application domain that multiple parts of the program might need to know about, such as the maximum number of points any player of a game is allowed to earn, or the speed of light.

// Naming hardcoded values used throughout your program as constants is useful in conveying the meaning of that value to future maintainers of the code. It also helps to have only one place in your code you would need to change if the hardcoded value needed to be updated in the future.

// Shadowing
// Variable shadowing refers to the declaration of a new variable with the same name as a previous variable. Caironautes say that the first variable is shadowed by the second, which means that the second variable is what the compiler will see when you use the name of the variable. In effect, the second variable overshadows the first, taking any uses of the variable name to itself until either it itself is shadowed or the scope ends. We can shadow a variable by using the same variable’s name and repeating the use of the let keyword as follows:

fn shadow() {
    let x = 5;
    let x = x + 1;
    {
        let x = x * 2;
        println!("Inner scope x value is: {}", x);
    }
    println!("Outer scope x value is: {}", x);
}

// This program first binds x to a value of 5. Then it creates a new variable x by repeating let x =, taking the original value and adding 1 so the value of x is then 6. Then, within an inner scope created with the curly brackets, the third let statement also shadows x and creates a new variable, multiplying the previous value by 2 to give x a value of 12. When that scope is over, the inner shadowing ends and x returns to being 6. When we run this program, it will output the following:

// scarb cairo-run 
// Compiling no_listing_03_shadowing v0.1.0 (listings/ch02-common-programming-concepts/no_listing_03_shadowing/Scarb.toml)
// Finished `dev` profile target(s) in 4 seconds
//  Running no_listing_03_shadowing
// Inner scope x value is: 12
// Outer scope x value is: 6
// Run completed successfully, returning []

