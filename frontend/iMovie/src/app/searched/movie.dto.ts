export interface MovieDTO {
    movieId: number;
    movieName: string;
    imgUrl: string;
    description: string;
    releaseDate: string;
    rating: number;
    genre: string[];
    languages: string[];
}