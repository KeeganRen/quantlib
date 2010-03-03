
/*
 Copyright (C) 2000, 2001, 2002, 2003 RiskMap srl
 Copyright (C) 2008 StatPro Italia srl

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it
 under the terms of the QuantLib license.  You should have received a
 copy of the license along with this program; if not, please email
 <quantlib-dev@lists.sf.net>. The license is also available online at
 <http://quantlib.org/license.shtml>.

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

#ifndef quantlib_volatilities_i
#define quantlib_volatilities_i

%include common.i
%include date.i
%include daycounters.i
%include types.i
%include currencies.i
%include observer.i
%include marketelements.i
%include interpolation.i

%{
using QuantLib::BlackVolTermStructure;
using QuantLib::LocalVolTermStructure;
using QuantLib::OptionletVolatilityStructure;
using QuantLib::SwaptionVolatilityStructure;
%}

%ignore BlackVolTermStructure;
class BlackVolTermStructure : public Extrapolator {
    #if defined(SWIGMZSCHEME) || defined(SWIGGUILE)
    %rename("reference-date") referenceDate;
    %rename("day-counter")    dayCounter;
    %rename("max-date")       maxDate;
    %rename("max-time")       maxTime;
    %rename("min-strike")     minStrike;
    %rename("max-strike")     maxStrike;
    %rename("black-vol")      blackVol;
    %rename("black-variance") blackVariance;
    %rename("black-forward-vol")      blackVol;
    %rename("black-forward-variance") blackVariance;
    #endif
  public:
    Date referenceDate() const;
    DayCounter dayCounter() const;
    Calendar calendar() const;
    Date maxDate() const;
    Time maxTime() const;
    Real minStrike() const;
    Real maxStrike() const;
    Volatility blackVol(const Date&, Real strike,
                        bool extrapolate = false) const;
    Volatility blackVol(Time, Real strike,
                        bool extrapolate = false) const;
    Real blackVariance(const Date&, Real strike,
                       bool extrapolate = false) const;
    Real blackVariance(Time, Real strike,
                       bool extrapolate = false) const;
    Volatility blackForwardVol(const Date&, const Date&,
                               Real strike, bool extrapolate = false) const;
    Volatility blackForwardVol(Time, Time, Real strike,
                               bool extrapolate = false) const;
    Real blackForwardVariance(const Date&, const Date&,
                              Real strike, bool extrapolate = false) const;
    Real blackForwardVariance(Time, Time, Real strike,
                              bool extrapolate = false) const;
};

%template(BlackVolTermStructure) boost::shared_ptr<BlackVolTermStructure>;
IsObservable(boost::shared_ptr<BlackVolTermStructure>);

%template(BlackVolTermStructureHandle) Handle<BlackVolTermStructure>;
IsObservable(Handle<BlackVolTermStructure>);
%template(RelinkableBlackVolTermStructureHandle)
RelinkableHandle<BlackVolTermStructure>;


%ignore LocalVolTermStructure;
class LocalVolTermStructure : public Extrapolator {
    #if defined(SWIGMZSCHEME) || defined(SWIGGUILE)
    %rename("reference-date") referenceDate;
    %rename("day-counter")    dayCounter;
    %rename("max-date")       maxDate;
    %rename("max-time")       maxTime;
    %rename("min-strike")     minStrike;
    %rename("max-strike")     maxStrike;
    %rename("local-vol")      localVol;
    #endif
  public:
    Date referenceDate() const;
    DayCounter dayCounter() const;
    Calendar calendar() const;
    Date maxDate() const;
    Time maxTime() const;
    Real minStrike() const;
    Real maxStrike() const;
    Volatility localVol(const Date&, Real u,
                        bool extrapolate = false) const;
    Volatility localVol(Time, Real u,
                        bool extrapolate = false) const;
};

%template(LocalVolTermStructure) boost::shared_ptr<LocalVolTermStructure>;
IsObservable(boost::shared_ptr<LocalVolTermStructure>);

%template(LocalVolTermStructureHandle) Handle<LocalVolTermStructure>;
IsObservable(Handle<LocalVolTermStructure>);
%template(RelinkableLocalVolTermStructureHandle)
RelinkableHandle<LocalVolTermStructure>;


%ignore OptionletVolatilityStructure;
class OptionletVolatilityStructure : public Extrapolator {
    #if defined(SWIGMZSCHEME) || defined(SWIGGUILE)
    %rename("reference-date") referenceDate;
    %rename("day-counter")    dayCounter;
    %rename("max-date")       maxDate;
    %rename("max-time")       maxTime;
    %rename("min-strike")     minStrike;
    %rename("max-strike")     maxStrike;
    %rename("black-variance") blackVariance;
    #endif
  public:
    Date referenceDate() const;
    DayCounter dayCounter() const;
    Calendar calendar() const;
    Date maxDate() const;
    Time maxTime() const;
    Real minStrike() const;
    Real maxStrike() const;
    Volatility volatility(const Date&, Real strike,
                          bool extrapolate = false) const;
    Volatility volatility(Time, Real strike,
                          bool extrapolate = false) const;
    Real blackVariance(const Date&, Rate strike,
                       bool extrapolate = false) const ;
    Real blackVariance(Time, Rate strike,
                       bool extrapolate = false) const;
};

%template(OptionletVolatilityStructure)
boost::shared_ptr<OptionletVolatilityStructure>;
IsObservable(boost::shared_ptr<OptionletVolatilityStructure>);

%template(OptionletVolatilityStructureHandle)
Handle<OptionletVolatilityStructure>;
IsObservable(Handle<OptionletVolatilityStructure>);

%template(RelinkableOptionletVolatilityStructureHandle)
RelinkableHandle<OptionletVolatilityStructure>;


%{
using QuantLib::SwaptionVolatilityStructure;
%}

%ignore SwaptionVolatilityStructure;
class SwaptionVolatilityStructure : public Extrapolator {
    #if defined(SWIGMZSCHEME) || defined(SWIGGUILE)
    %rename("reference-date")  referenceDate;
    %rename("day-counter")     dayCounter;
    %rename("max-option-date")  maxOptionDate;
    %rename("max-option-time")  maxOptionTime;
    %rename("max-swap-tenor")      maxSwapTenor;
    %rename("max-swap-length") maxSwapLength;
    %rename("min-strike")      minStrike;
    %rename("max-strike")      maxStrike;
    %rename("black-variance")  blackVariance;
    #endif
  public:
    Date referenceDate() const;
    DayCounter dayCounter() const;
    Calendar calendar() const;
    Period maxSwapTenor() const;
    Time maxSwapLength() const;
    Real minStrike() const;
    Real maxStrike() const;
    Volatility volatility(const Date& start, const Period& length,
                          Rate strike, bool extrapolate = false) const;
    Volatility volatility(Time start, Time length,
                          Rate strike, bool extrapolate = false) const;
    Real blackVariance(const Date& start, const Period& length,
                       Rate strike, bool extrapolate = false) const;
    Real blackVariance(Time start, Time length,
                       Rate strike, bool extrapolate = false) const;
};

%template(SwaptionVolatilityStructure)
    boost::shared_ptr<SwaptionVolatilityStructure>;
IsObservable(boost::shared_ptr<SwaptionVolatilityStructure>);

%template(SwaptionVolatilityStructureHandle)
Handle<SwaptionVolatilityStructure>;
IsObservable(Handle<SwaptionVolatilityStructure>);
%template(RelinkableSwaptionVolatilityStructureHandle)
RelinkableHandle<SwaptionVolatilityStructure>;



// actual term structures below

// constant Black vol term structure
%{
using QuantLib::BlackConstantVol;
typedef boost::shared_ptr<BlackVolTermStructure> BlackConstantVolPtr;
%}

%rename(BlackConstantVol) BlackConstantVolPtr;
class BlackConstantVolPtr : public boost::shared_ptr<BlackVolTermStructure> {
  public:
    %extend {
        BlackConstantVolPtr(const Date& referenceDate,
                            const Calendar & c,
                            Volatility volatility,
                            const DayCounter& dayCounter) {
            return new BlackConstantVolPtr(
                new BlackConstantVol(referenceDate, c,
                                     volatility, dayCounter));
        }
        BlackConstantVolPtr(const Date& referenceDate,
                            const Calendar &c,
                            const Handle<Quote>& volatility,
                            const DayCounter& dayCounter) {
            return new BlackConstantVolPtr(
                new BlackConstantVol(referenceDate, c,
                                     volatility, dayCounter));
        }
        BlackConstantVolPtr(Natural settlementDays, const Calendar& calendar,
                            Volatility volatility,
                            const DayCounter& dayCounter) {
            return new BlackConstantVolPtr(
                new BlackConstantVol(settlementDays, calendar,
                                     volatility, dayCounter));
        }
        BlackConstantVolPtr(Natural settlementDays, const Calendar& calendar,
                            const Handle<Quote>& volatility,
                            const DayCounter& dayCounter) {
            return new BlackConstantVolPtr(
                new BlackConstantVol(settlementDays, calendar,
                                     volatility, dayCounter));
        }
    }
};

// Black ATM curve

%{
using QuantLib::BlackVarianceCurve;
typedef boost::shared_ptr<BlackVolTermStructure> BlackVarianceCurvePtr;
%}

%rename(BlackVarianceCurve) BlackVarianceCurvePtr;
class BlackVarianceCurvePtr : public boost::shared_ptr<BlackVolTermStructure> {
  public:
    %extend {
        BlackVarianceCurvePtr(const Date& referenceDate,
                              const std::vector<Date>& dates,
                              const std::vector<Real>& volatilities,
                              const DayCounter& dayCounter,
                              bool forceMonotoneVariance = true) {
            return new BlackVarianceCurvePtr(
                new BlackVarianceCurve(referenceDate,
                                       dates, volatilities,
                                       dayCounter, forceMonotoneVariance));
        }
    }
};



// Black smiled surface
%{
using QuantLib::BlackVarianceSurface;
typedef boost::shared_ptr<BlackVolTermStructure> BlackVarianceSurfacePtr;
%}

#if defined(SWIGJAVA) || defined(SWIGCSHARP)
%rename(_BlackVarianceSurface) BlackVarianceSurface;
#else
%ignore BlackVarianceSurface;
#endif
class BlackVarianceSurface {
  public:
    enum Extrapolation { ConstantExtrapolation,
                         InterpolatorDefaultExtrapolation };
#if defined(SWIGJAVA) || defined(SWIGCSHARP)
  private:
    BlackVarianceSurface();
#endif
};

%rename(BlackVarianceSurface) BlackVarianceSurfacePtr;
class BlackVarianceSurfacePtr
    : public boost::shared_ptr<BlackVolTermStructure> {
  public:
    %extend {
        BlackVarianceSurfacePtr(
                const Date& referenceDate,
                const Calendar & cal,
                const std::vector<Date>& dates,
                const std::vector<Real>& strikes,
                const Matrix& blackVols,
                const DayCounter& dayCounter,
                BlackVarianceSurface::Extrapolation lower =
                    BlackVarianceSurface::InterpolatorDefaultExtrapolation,
                BlackVarianceSurface::Extrapolation upper =
                    BlackVarianceSurface::InterpolatorDefaultExtrapolation) {
            return new BlackVarianceSurfacePtr(
                new BlackVarianceSurface(referenceDate,cal,
                                         dates,strikes,
                                         blackVols,dayCounter,lower,upper));
        }
        static const BlackVarianceSurface::Extrapolation
            ConstantExtrapolation =
            BlackVarianceSurface::ConstantExtrapolation;
        static const BlackVarianceSurface::Extrapolation
            InterpolatorDefaultExtrapolation =
            BlackVarianceSurface::InterpolatorDefaultExtrapolation;
    }
};



// constant local vol term structure
%{
using QuantLib::LocalConstantVol;
typedef boost::shared_ptr<LocalVolTermStructure> LocalConstantVolPtr;
%}

%rename(LocalConstantVol) LocalConstantVolPtr;
class LocalConstantVolPtr : public boost::shared_ptr<LocalVolTermStructure> {
  public:
    %extend {
        LocalConstantVolPtr(
                const Date& referenceDate, Volatility volatility,
                const DayCounter& dayCounter) {
            return new LocalConstantVolPtr(
                new LocalConstantVol(referenceDate, volatility, dayCounter));
        }
        LocalConstantVolPtr(
                const Date& referenceDate,
                const Handle<Quote>& volatility,
                const DayCounter& dayCounter) {
            return new LocalConstantVolPtr(
                new LocalConstantVol(referenceDate, volatility, dayCounter));
        }
        LocalConstantVolPtr(
                Integer settlementDays, const Calendar& calendar,
                Volatility volatility,
                const DayCounter& dayCounter) {
            return new LocalConstantVolPtr(
                new LocalConstantVol(settlementDays, calendar,
                                     volatility, dayCounter));
        }
        LocalConstantVolPtr(
                Integer settlementDays, const Calendar& calendar,
                const Handle<Quote>& volatility,
                const DayCounter& dayCounter) {
            return new LocalConstantVolPtr(
                new LocalConstantVol(settlementDays, calendar,
                                     volatility, dayCounter));
        }
    }
};


// constant caplet constant term structure
%{
using QuantLib::ConstantOptionletVolatility;
typedef boost::shared_ptr<OptionletVolatilityStructure>
    ConstantOptionletVolatilityPtr;
%}

%rename(ConstantOptionletVolatility) ConstantOptionletVolatilityPtr;
class ConstantOptionletVolatilityPtr
    : public boost::shared_ptr<OptionletVolatilityStructure> {
  public:
    %extend {
        ConstantOptionletVolatilityPtr(const Date& referenceDate,
                                       const Calendar &cal,
                                       BusinessDayConvention bdc,
                                       Volatility volatility,
                                       const DayCounter& dayCounter) {
            return new ConstantOptionletVolatilityPtr(
                new ConstantOptionletVolatility(referenceDate,
                                                cal, bdc, volatility,
                                                dayCounter));
        }
        ConstantOptionletVolatilityPtr(const Date& referenceDate,
                                       const Calendar &cal,
                                       BusinessDayConvention bdc,
                                       const Handle<Quote>& volatility,
                                       const DayCounter& dayCounter) {
            return new ConstantOptionletVolatilityPtr(
                new ConstantOptionletVolatility(referenceDate,
                                                cal, bdc, volatility,
                                                dayCounter));
        }
        ConstantOptionletVolatilityPtr(Natural settlementDays,
                                       const Calendar &cal,
                                       BusinessDayConvention bdc,
                                       Volatility volatility,
                                       const DayCounter& dayCounter) {
            return new ConstantOptionletVolatilityPtr(
                new ConstantOptionletVolatility(settlementDays,
                                                cal, bdc, volatility,
                                                dayCounter));
        }
        ConstantOptionletVolatilityPtr(Natural settlementDays,
                                       const Calendar &cal,
                                       BusinessDayConvention bdc,
                                       const Handle<Quote>& volatility,
                                       const DayCounter& dayCounter) {
            return new ConstantOptionletVolatilityPtr(
                new ConstantOptionletVolatility(settlementDays,
                                                cal, bdc, volatility,
                                                dayCounter));
        }
    }
};



%{
using QuantLib::SwaptionVolatilityMatrix;
typedef boost::shared_ptr<SwaptionVolatilityStructure>
    SwaptionVolatilityMatrixPtr;
%}

%rename(SwaptionVolatilityMatrix) SwaptionVolatilityMatrixPtr;
class SwaptionVolatilityMatrixPtr
    : public boost::shared_ptr<SwaptionVolatilityStructure> {
  public:
    %extend {
        SwaptionVolatilityMatrixPtr(const Date& referenceDate,
                                    const std::vector<Date>& dates,
                                    const std::vector<Period>& lengths,
                                    const Matrix& vols,
                                    const DayCounter& dayCounter) {
            return new SwaptionVolatilityMatrixPtr(
                new SwaptionVolatilityMatrix(referenceDate,dates,lengths,
                                             vols,dayCounter));
        }
    }
};


#endif