package com.onurvar.massiverpg.di

import android.app.Application
import com.onurvar.massiverpg.data.datasource.FirebaseAuthDataSourceImpl
import com.onurvar.massiverpg.data.datasource.FirebaseFirestoreDataSourceImpl
import com.onurvar.massiverpg.data.repository.AuthRepositoryImpl
import com.onurvar.massiverpg.data.repository.CharacterRepositoryImpl
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseAuthDataSource
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseFirestoreDataSource
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository
import com.onurvar.massiverpg.domain.protocol.repository.CharacterRepository
import com.onurvar.massiverpg.domain.protocol.usecase.BeginSignInUseCase
import com.onurvar.massiverpg.domain.usecase.BeginSignInUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.CheckSignedInUserUseCase
import com.onurvar.massiverpg.domain.protocol.usecase.GetCharacterListUseCase
import com.onurvar.massiverpg.domain.usecase.CheckSignedInUserUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.SignInUseCase
import com.onurvar.massiverpg.domain.usecase.SignInUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.SignOutUseCase
import com.onurvar.massiverpg.domain.usecase.GetCharacterListUseCaseImpl
import com.onurvar.massiverpg.domain.usecase.SignOutUseCaseImpl
import com.onurvar.massiverpg.presentation.HomeScreen.HomeScreenViewModel
import com.onurvar.massiverpg.presentation.RootScreen.RootScreenViewModel
import com.onurvar.massiverpg.presentation.SignInScreen.SignInScreenViewModel
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    fun provideFirebaseAuthDataSource(application: Application): FirebaseAuthDataSource {
        return FirebaseAuthDataSourceImpl(application)
    }

    @Provides
    fun provideFirebaseFirestoreDataSource(): FirebaseFirestoreDataSource {
        return FirebaseFirestoreDataSourceImpl()
    }

    @Provides
    fun provideAuthRepository(firebaseAuthDataSource: FirebaseAuthDataSource): AuthRepository {
        return AuthRepositoryImpl(firebaseAuthDataSource)
    }

    @Provides
    fun provideCharacterRepository(
        firebaseAuthDataSource: FirebaseAuthDataSource,
        firebaseFirestoreDataSource: FirebaseFirestoreDataSource
    ): CharacterRepository {
        return CharacterRepositoryImpl(firebaseAuthDataSource, firebaseFirestoreDataSource)
    }

    @Provides
    fun provideBeginSignInUseCase(authRepository: AuthRepository): BeginSignInUseCase {
        return BeginSignInUseCaseImpl(authRepository)
    }

    @Provides
    fun provideSignInUseCase(authRepository: AuthRepository): SignInUseCase {
        return SignInUseCaseImpl(authRepository)
    }

    @Provides
    fun provideCheckSignedInUserUseCase(authRepository: AuthRepository): CheckSignedInUserUseCase {
        return CheckSignedInUserUseCaseImpl(authRepository)
    }

    @Provides
    fun provideSignOutUseCase(authRepository: AuthRepository): SignOutUseCase {
        return SignOutUseCaseImpl(authRepository)
    }

    @Provides
    fun provideGetCharacterListUseCase(characterRepository: CharacterRepository): GetCharacterListUseCase {
        return GetCharacterListUseCaseImpl(characterRepository)
    }

    @Provides
    fun provideRootViewModel(checkSignedInUserUseCase: CheckSignedInUserUseCase): RootScreenViewModel {
        return RootScreenViewModel(checkSignedInUserUseCase)
    }

    @Provides
    fun provideHomeViewModel(
        application: Application,
        signOutUseCase: SignOutUseCase
    ): HomeScreenViewModel {
        return HomeScreenViewModel(application, signOutUseCase)
    }

    @Provides
    fun provideSignInViewModel(
        application: Application,
        beginSignInUseCase: BeginSignInUseCase, signInUseCase: SignInUseCase
    ): SignInScreenViewModel {
        return SignInScreenViewModel(application, beginSignInUseCase, signInUseCase)
    }

}